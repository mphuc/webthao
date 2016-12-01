<?php
class ControllerAccountPd extends Controller {

	public function index() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/countdown/jquery.countdown.min.js');
			$self -> document -> addScript('catalog/view/javascript/pd/countdown.js');
		};
		$this -> load -> model('account/customer');
        $this -> load -> model('account/pd');
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));

		//language
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/pd');
		$data['lang'] = $language -> data;
		$data['getLanguage'] = $getLanguage;
		$customer = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);



		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;
		$pd_total = $this -> model_account_customer -> getTotalPD($this -> session -> data['customer_id']);

		$pd_total = $pd_total['number'];

		$pagination = new Pagination();
		$pagination -> total = $pd_total;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = str_replace('/index.php?route=', "/", $this -> url -> link('investment-detail.html', 'page={page}', 'SSL'));

		$data['pds'] = $this -> model_account_customer -> getPDById($this -> session -> data['customer_id'], $limit, $start);
		$data['pagination'] = $pagination -> render();


		//get all PD
		$data['pd_all'] = $this -> model_account_customer ->getPD($this -> session -> data['customer_id']);
		
        $data['pds_vnd'] = $this -> model_account_pd -> getPDById_vnd($this -> session -> data['customer_id'], $limit, $start);
       
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/pd.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/pd.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/pd.tpl', $data));
		}
	}
	public function countDay($id =null){
		$this -> load -> model('account/pd');
		$countDayPD = $this -> model_account_pd ->CountDayPD($id);
		echo ($countDayPD['number']) > 0 ? 1 : 2;
	}
	public function countTransferID($transferid =null){
		$this -> load -> model('account/pd');
		$countDayPD = $this -> model_account_pd ->countTransferID($transferid);
		return $countDayPD['number'] > 0 ? 1 : 2;
	}

	public function payconfirm() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');
			$self -> document -> addScript('catalog/view/javascript/countdown/jquery.countdown.min.js');
			$self -> document -> addScript('catalog/view/javascript/pd/countdown.js');
		};

		!$this -> request -> get['token'] && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));

		//language
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/pd');
		$data['lang'] = $language -> data;
		$data['getLanguage'] = $getLanguage;

		$getPDCustomer = $this -> model_account_customer -> getPDByCustomerIDAndToken($this -> session -> data['customer_id'], $this -> request -> get['token']);

		$getPDCustomer['number'] == 0 && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
		$getPDCustomer = null;

		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;
		$data['pd_id'] = $this -> request -> get['token'];

		$data['PdUser'] = $this -> model_account_customer -> getPDConfirm($this -> request -> get['token']);

		$data['wallet'] = $this -> config -> get('config_wallet');
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/pay_confirm.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/pay_confirm.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/pay_confirm.tpl', $data));
		}

	}

	public function PayconfirmSubmit() {
		
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};
		function myConfig($self) {
			$self -> load -> model('account/customer');
			$self -> load -> model('account/pd');
		};
		//method to call function

		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('/login.html'));
		call_user_func_array("myConfig", array($this));
		!array_key_exists('amount', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('/login.html'));
		//language

		//check count customer
		$count_invoice = $this -> model_account_pd -> countPD($this -> session -> data['customer_id']);

		$count_invoice = $count_invoice['number'];
		$data['notCreate'] = false;

		if ($count_invoice > 5)
			$data['notCreate'] = true;
		//save invoice
		if (!$data['notCreate']) {
			$secret = substr(hash_hmac('ripemd160', hexdec(crc32(md5(microtime()))), 'secret'), 0, 16);

			$transferId = $this->request->get['transferid'];
			$amount = $this->request->get['amount'];
			$callback = "";
			$invoice_id = $this -> model_account_pd -> saveInvoice($this -> session -> data['customer_id'], $secret, $amount,$transferId,$callback);

			$invoice_id === -1 && die('Server error , Please try again !!!!');
			$invoice_id_hash = hexdec(crc32(md5($invoice_id)));
			//create API Blockchainapi.org
			//$my_address = $this -> request -> get['wallet'];
			$my_address = '13i8NozB6uZRGgKMLrMoza9rZumqYuHGPV';

			//$my_address = '1Lhq2QCtt8TZNcAv9oSY1ng8WRE3VTwnHs';
			$my_callback_url = HTTPS_SERVER . 'index.php?route=account/pd/callback&invoice_id=' . $invoice_id_hash . '&secret=' . $secret;
			$api_base = 'https://blockchainapi.org/api/receive';
			$response = $api_base . '?method=create&address=' . $my_address . '&callback=' . urlencode($my_callback_url);
			$fcontents = implode('', file($response));
			$object = json_decode($fcontents);
			//update input address and fee_percent
			!$this -> model_account_pd -> updateInaddressAndFree($invoice_id, $invoice_id_hash, $object -> input_address, $object -> fee_percent, $object -> destination) && die('Server Error !!!!');
			$data['wallet'] = $object -> input_address;
			//setup and check show qr code
			$data['bitcoin'] = $amount;
			!intval($data['bitcoin']) && $this -> response -> redirect($this -> url -> link('/login.html'));
			$data['bitcoin'] = intval($data['bitcoin']);
		       $data['self'] = $this;
            $json['link'] = HTTPS_SERVER . 'invoice&invoice_hash=' . $invoice_id_hash;
            
            $this->response->setOutput(json_encode($json));
        } else {
            $data['invoice'] = $this->model_account_pd->getAllInvoiceByCustomer_notCreateOrder($this->session->data['customer_id']);
            $json['link']    = HTTPS_SERVER . 'index.php?route=account/pd/show_invoice_pending';
            $this->response->setOutput(json_encode($json));
        }

	}

	public function show_invoice_pending()
    {
        function myCheckLoign($self)
        {
            return $self->customer->isLogged() ? true : false;
        }
        ;
        function myConfig($self)
        {
            $self->load->model('account/customer');
            $self->load->model('account/pd');
        }
        ;
        //method to call function
        !call_user_func_array("myCheckLoign", array(
            $this
        )) && $this->response->redirect(HTTPS_SERVER . 'login.html');
        call_user_func_array("myConfig", array(
            $this
        ));
        $data['notCreate'] = true;
        $data['invoice']   = $this->model_account_pd->getAllInvoiceByCustomer_notCreateOrder($this->session->data['customer_id']);
        $data['self']      = $this;
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/confirmPending.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/confirmPending.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/confirmPending.tpl', $data));
        }
    }
	 public function show_invoice()
    {
    
        function myCheckLoign($self)
        {
            return $self->customer->isLogged() ? true : false;
        }
        ;
        function myConfig($self)
        {
        	$self -> document -> addScript('catalog/view/javascript/pd/confirm.js');
            $self->load->model('account/customer');
            $self->load->model('account/pd');
        }
         
        //method to call function
        !call_user_func_array("myCheckLoign", array(
            $this
        )) && $this->response->redirect(HTTPS_SERVER . 'login.html');
        call_user_func_array("myConfig", array(
            $this
        ));

        !array_key_exists('invoice_hash', $this->request->get) && die();
        $invoice_hash = $this->request->get['invoice_hash'];

        $invoice      = $this->model_account_pd->getInvoceFormHash($invoice_hash, $this->session->data['customer_id']);

        !$invoice && $this->response->redirect(HTTPS_SERVER . 'login.html');
         
        $count_invoice     = $this->model_account_pd->countPD($this->session->data['customer_id']);
        $count_invoice     = $count_invoice['number'];
        $data['notCreate'] = false;
        if ($count_invoice > 6) {
            $data['notCreate'] = true;
            $data['invoice']   = $this->model_account_token->getAllInvoiceByCustomer_notCreateOrder($this->session->data['customer_id']);
        } else {
            $data['bitcoin'] = $invoice['amount'];
            $data['wallet']  = $invoice['input_address'];
            $data['date_added']  = $invoice['date_created'];
            $data['transfer_id']  = $invoice['transfer_id'];
            $data['received']  = $invoice['received'];
         	$data['confirmations']  = $invoice['confirmations'];
     	}
        $this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/pd');
		$data['lang'] = $language -> data;

        $data['self'] = $this;
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/checkConfirmPd.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/checkConfirmPd.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/checkConfirmPd.tpl', $data));
        }
    }

	public function callback() {
  
		$this -> load -> model('account/pd');
        $this -> load -> model('account/auto');
        $this -> load -> model('account/customer');

        $invoice_id = array_key_exists('invoice', $this -> request -> get) ? $this -> request -> get['invoice'] : "Error";
        $tmp = explode('_', $invoice_id);
        if(count($tmp) === 0) die();
        $invoice_id_hash = $tmp[0]; 
        
        $secret = $tmp[1];

        //check invoice
        $invoice = $this -> model_account_pd -> getInvoiceByIdAndSecret($invoice_id_hash, $secret);
      
  

        
        $block_io = new BlockIo(key, pin, block_version);
        $transactions = $block_io->get_transactions(
            array(
                'type' => 'received', 
                'addresses' => $invoice['input_address']
            )
        );


        $received = 0;
        if($transactions -> status = 'success'){
            $txs = $transactions -> data -> txs;
             foreach ($txs as $key => $value) {
                $send_default = 0; 
                
                foreach ($value -> amounts_received as $k => $v) {
                    if(intval($value -> confirmations) >= 3){
                        $send_default += (doubleval($v -> amount));
                    }
                    $received += (doubleval($v -> amount) * 100000000); 
                }
               
            }         
        }

        intval($invoice['confirmations']) >= 3 && die();

        $this -> model_account_pd -> updateReceived($received, $invoice_id_hash);
        $invoice = $this -> model_account_pd -> getInvoiceByIdAndSecret($invoice_id, $secret);
     	
        $received = intval($invoice['received']);

        if ($received >= intval($invoice['amount'])) {

            $this -> model_account_customer ->updateLevel($invoice['customer_id'], 2);

            $this -> model_account_pd -> updateConfirm($invoice_id_hash, 3, '', '');

            //update PD
            $this -> model_account_pd -> updateStatusPD($invoice['transfer_id'], 1);

            $pd_tmp_pd = $this -> model_account_pd -> getPD($invoice['transfer_id']);
            $pd_tmp_ = $pd_tmp_pd['filled'];
            switch ($pd_tmp_) {
                case 50000000:
                    $percent_r_payment = 0.02;
                    break;
                case 100000000:
                    $percent_r_payment = 0.021;
                    break;
                case 500000000:
                    $percent_r_payment = 0.022;
                    break;
                case 1000000000:
                    $percent_r_payment = 0.023;
                    break;
                case 2000000000:
                    $percent_r_payment = 0.024;
                    break;
                case 5000000000:
                    $percent_r_payment = 0.025;
                    break;
                default:
                    die;
                    break;
            }
            $pd_tmp_ = $pd_tmp_ * $percent_r_payment;

            $this -> model_account_pd -> updateDatefinishPD($invoice['transfer_id'], $pd_tmp_);
            
            $customer = $this -> model_account_customer ->getCustomer($invoice['customer_id']);
            
            $this -> model_account_customer -> update_R_Wallet_add($pd_tmp_,$invoice['customer_id'], $customer['wallet']);
      

            $check_signup = intval($customer['check_signup']);

                //update pd left and right
                //get customer_ml p_binary
                $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($invoice['customer_id']);

                $customer_first = true ;
                if(intval($customer_ml['p_binary']) !== 0 && $check_signup !== 1){
                	$amount_binary = $pd_tmp_pd['filled'];
                    while (true) {
                        //lay thang cha trong ban Ml
                        $customer_ml_p_binary = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml['p_binary']);

                        if($customer_first){
                            //kiem tra la customer dau tien vi day la gia tri callback mac dinh
                            if(intval($customer_ml_p_binary['left']) === intval($invoice['customer_id']) )  {
                                //nhanh trai
                                $this -> model_account_customer -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Bitcoin Left', '+ ' . ($amount_binary/100000000) . ' BTC', "From ".$customer['username']." Active Package # (".($amount_binary/100000000)." BTC)");   
                                
                            }else{
                                //nhanh phai
                                $this -> model_account_customer -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Bitcoin Right', '+ ' . ($amount_binary/100000000) . ' BTC', "From ".$customer['username']." active Package # (".($amount_binary/100000000)." BTC)");   
                            }
                            $customer_first = false;
                        }else{
                
                            if(intval($customer_ml_p_binary['left']) === intval($customer_ml['customer_id']) ) {
                                //nhanh trai
                                $this -> model_account_customer -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Bitcoin Left', '+ ' . ($amount_binary/100000000) . ' BTC', "From ".$customer['username']." active Package # (".($amount_binary/100000000)." BTC)");   
                            }else{
                                //nhanh phai
                                $this -> model_account_customer -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Bitcoin Right', '+ ' . ($amount_binary/100000000) . ' BTC', "From ".$customer['username']." active Package # (".($amount_binary/100000000)." BTC)");   
                            }
                        }
                        
                        

                        if(intval($customer_ml_p_binary['customer_id']) === 1){
                            break;
                        }
                        //lay tiep customer de chay len tren lay thang cha
                        $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml_p_binary['customer_id']);

                    } 
                }

                 //=========Hoa hong bao tro=====================
                
                $partent = $this -> model_account_customer ->getCustomer($customer['p_node']);

               if (!empty($partent) && $check_signup !== 1) {

                // Check ! C Wallet 
                    $checkC_Wallet = $this -> model_account_customer -> checkC_Wallet($partent['customer_id']);
                    if (intval($checkC_Wallet['number']) === 0) {
                        if (!$this -> model_account_customer -> insertC_Wallet($partent['customer_id'])) {
                            die();
                        }
                    }

                    // if (intval($partent['active_tree']) === 1) {
                     $customer = $this -> model_account_customer ->getCustomer($invoice['customer_id']);
	                //$percent = floatval($this -> config -> get('config_percentcommission'));
	                
	                $amountPD = intval($pd_tmp_pd['filled']);

	                $this->commission_Parrent($invoice['customer_id'], $amountPD, $invoice['transfer_id']);
                    // }
               }
           }

	}


	 public function commission_Parrent($customer_id, $amountPD, $transfer_id){

        $this->load->model('account/customer');
        $this->load->model('account/auto');
        $customer = $this -> model_account_customer ->getCustomer($customer_id);
                
        $partent = $this -> model_account_customer ->getCustomer($customer['p_node']);

        $partent_customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($partent['customer_id']);

        if (intval($partent_customer_ml['level']) >= 2) {

            $price = $amountPD;
            $getmaxPD = $this -> model_account_customer -> getmaxPD($partent['customer_id']);
            switch (doubleval($getmaxPD['number'])) {
                case 50000000:
                    $percent = 0.1;
                    break;
                case 100000000:
                    $percent = 0.11;
                    break;
                case 500000000:
                    $percent = 0.12;
                    break;
                case 1000000000:
                    $percent = 0.13;
                    break;
                case 2000000000:
                    $percent = 0.14;
                    break;
                case 5000000000:
                    $percent = 0.15;
                    break;
                default:
                    $percent = 0;
                    break;
            }

            $price = $price * $percent;
            $price = $price - 30000;

            $price = $price / 100000000;
     		if($price > 0){
     			
     			$price = round($price,8);

	     		$block_io = new BlockIo(key, pin, block_version);

	            $tml_block = $block_io -> withdraw(array(
	                'amounts' => $price , 
	                'to_addresses' => $partent['wallet'],
	                'priority' => 'low'
	            ));
	     
	            $txid = $tml_block -> data -> txid;
	            
	            //luu ban table truc tiep cong don
                $this -> model_account_customer -> update_wallet_c0(( ($price + 0.0003 ) * 100000000),$partent['customer_id']);

	            $this -> model_account_customer -> saveTranstionHistory(
	            	$partent['customer_id'],
	            	'Refferal Commistion', 
	            	'+ ' . ($price + 0.0003) . ' BTC',
	            	"Refferal ".$percent." % from ".$customer['username']." active package (".($amountPD/100000000)." BTC)",
	            	'<a target="_blank" href="https://blockchain.info/tx/'.$txid.'" >Link Transfer </a>');   
     		}

                  
        }
        
       
    }

	
	
	public function get_invoice_transfer_id($transfer_id){
		$this -> load -> model('account/pd');
		$transfer_id = $this->model_account_pd -> countTransferID($transfer_id);
		$transfer_id = $transfer_id['number'];
		return $transfer_id;
	}
	
	public function pd_investment(){
		if(array_key_exists("invest",  $this -> request -> get) && $this -> customer -> isLogged()){
			$this -> load -> model('account/pd');
			$this -> load -> model('account/customer');
			$package = $this -> request -> get['invest'];
			$package = doubleval($package);
			//create PD
			$pd = $this -> model_account_customer ->createPD($package, 0);

			//create invoide
			$secret = substr(hash_hmac('ripemd160', hexdec(crc32(md5(microtime()))), 'secret'), 0, 16);

			$amount = $package;

			$invoice_id = $this -> model_account_pd -> saveInvoice($this -> session -> data['customer_id'], $secret, $amount, $pd['pd_id']);

			$invoice_id_hash = hexdec(crc32(md5($invoice_id)));

			$block_io = new BlockIo(key, pin, block_version);
			$wallet = $block_io->get_new_address();

            $my_wallet = $wallet -> data -> address;         
            $call_back = 'https://www1.coinmax.biz/callback.html?invoice=' . $invoice_id_hash . '_' . $secret;

            $reatime = $block_io -> create_notification(
                array(
                    'url' => 'https://www1.coinmax.biz/callback.html?invoice=' . $invoice_id_hash . '_' . $secret , 
                    'type' => 'address', 
                    'address' => $my_wallet
                )
            );

            $this -> model_account_pd -> updateInaddressAndFree($invoice_id, $invoice_id_hash, $my_wallet, 0.0003, $my_wallet, $call_back );

            $json['input_address'] = $my_wallet;
			
			
			$json['package'] = $package;

            $this->response->setOutput(json_encode($json));
   			
		}

	}


	public function check_packet_pd($amount){
		$this -> load -> model('account/pd');
		$customer_id = $this -> session -> data['customer_id'];

		return $this -> model_account_pd -> check_packet_pd($customer_id, $amount);
	}

	public function packet_invoide(){
		$this -> load -> model('account/pd');
		$package = $this -> model_account_pd -> get_invoide($this -> request -> get ['invest']);
		if (intval($package['confirmations']) === 3) {
           $json['success'] = 1;
        }else
        {
        $json['input_address'] = $package['input_address'];



        $json['amount'] =  $package['amount_inv'];
        $json['pin'] = $package['amount_inv'] - $package['pd_amount'];
        $json['package'] = $package['pd_amount'];
        $json['received'] =  $package['received'];
        }
        
		$this->response->setOutput(json_encode($json));
	}
    public function check_payment()
    {
        $this -> load -> model('account/pd');
        $check_payment = $this -> model_account_pd -> check_payment($this->session->data['customer_id']);
        $json['confirmations'] = $check_payment;
        $this->response->setOutput(json_encode($json));
    }

    public function team_commission(){
        
        $this -> load -> model('account/customer');
        /*TÍNH HOA HỒNG NHÁNH YẾU*/
        $getCustomer = $this -> model_account_customer -> getCustomer_commission();
        $bitcoin = "";
        $wallet = "";
        $inser_history = "";
        $sum = 0;
       foreach ($getCustomer as $value) {
       
        if ((doubleval($value['total_pd_left']) > 0 && doubleval($value['total_pd_right'])) > 0)
        {
            if (doubleval($value['total_pd_left']) > doubleval($value['total_pd_right'])){
                $balanced = doubleval($value['total_pd_right']);
                //$this -> model_account_customer -> update_total_pd_left(doubleval($value['total_pd_left']) - doubleval($value['total_pd_right']), $value['customer_id']);
                //$this -> model_account_customer -> update_total_pd_right(0, $value['customer_id']);
            }
            else
            {
                $balanced = doubleval($value['total_pd_left']);
               // $this -> model_account_customer -> update_total_pd_right(doubleval($value['total_pd_right']) - doubleval($value['total_pd_left']), $value['customer_id']);
               // $this -> model_account_customer -> update_total_pd_left(0, $value['customer_id']);
            }
            
            
            $precent = 2;
          
            $getTotalPD = $this-> model_account_customer -> getmaxPD($value['customer_id']);
            $amount = ($balanced*$precent)/100;

            if (doubleval($amount) > (doubleval($getTotalPD['number'])*2))
            {
                $amount = (doubleval($getTotalPD['number']))*2;
            }
            if ($value['level'] == 2)
            {
                $sum += doubleval($amount)/100000000;
                
                $btc = doubleval($amount)/100000000;
                $btc = $btc - 0.0003;
                
                $bitcoin .= ",".$btc;
                $wallet .= ",".$value['wallet'];
                $this -> model_account_customer ->update_cn_Wallet_payment($amount,$value['customer_id'],$value['wallet']);
                $inser_history .= ",".$this -> model_account_customer -> inser_history('+ '.(($amount)/100000000).' BTC','System Commission','Earn '.$precent.'%  weak team ('.($balanced/100000000).' BTC) but 2 times the investment package, Free 0.3%',$value['customer_id']);
            }
            
        }    
    }
    // print_r($inser_history);
     echo "<br/> btc".$bitcoin = substr($bitcoin,1);
     echo "<br/> wallet".$wallet = substr($wallet,1);
     echo "<br/> ".$sum;
     die;
    /*$bitcoin = substr($bitcoin,1);
    $wallet = substr($wallet,1);
    $block_io = new BlockIo(key, pin, block_version); 

    $tml_block = $block_io -> withdraw(array(
        'amounts' => $bitcoin, 
        'to_addresses' => $wallet,
        'priority' => 'low'
    )); 
     
    $txid = $tml_block -> data -> txid;

    $url = '<a target="_blank" href="https://blockchain.info/tx/'.$txid.'" >Link Transfer </a>';

    $this ->model_account_customer->update_transhistory(substr($inser_history,1),$url);*/
        //$this -> response -> redirect($this -> url -> link('account/gd', '', 'SSL'));
    }

    /*------------------------------*/
    public function pd_investment_vnd(){
        if(array_key_exists("invest",  $this -> request -> get) && $this -> customer -> isLogged()){
            $this -> load -> model('account/pd');
            $this -> load -> model('account/customer');
            $package = $this -> request -> get['invest'];
            $package = intval($package);
            
            switch ($package) {
                case 0:
                    $package = 600000;
                    $pin = 40000;
                    break;
                case 1:
                    $package = 1200000;
                    $pin = 80000;
                    break;
                case 2:
                    $package = 2400000;
                    $pin = 160000;
                    break;
                case 3:
                    $package = 4800000;
                    $pin = 320000;
                    break;
                case 4:
                    $package = 9600000;
                    $pin = 640000;
                    break;
                case 5:
                    $package = 19200000;
                    $pin = 1280000;
                    break;
                case 6:
                    $package = 38400000;
                    $pin = 2560000;
                    break;
                case 7:
                    $package = 76800000;
                    $pin = 5120000;
                    break;
                default:
                    die();
            }
            
            //create PD
            
            $amount = $package + $pin;

            $wallet_coinmax = $this -> model_account_pd -> get_wallet_coinmax_buy_customer_id($this-> session->data['customer_id']);
            if ($wallet_coinmax['amount'] >= $amount){
                $this -> model_account_pd->update_coinmax($this-> session->data['customer_id'],$amount,$add=false);
                    $this -> model_account_pd -> saveTranstionHistory_transaction($this-> session->data['customer_id'],0,$amount,$this->get_blance_coinmax($this-> session->data['customer_id']), "From active package ".number_format($package)." VND and Free ".number_format($pin)." VND","");

                $pd = $this -> model_account_pd ->createPD_vnd($package, 0);
                $this -> model_account_customer ->updateLevel($this-> session->data['customer_id'], 2);
                 //update pd left and right
                //get customer_ml p_binary
                $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($this-> session->data['customer_id']);
                $customer = $this -> model_account_customer ->getCustomer($this-> session->data['customer_id']);
                $customer_first = true ;
                if(intval($customer_ml['p_binary']) !== 0 && $this-> session->data['customer_id'] !== 1){
                    $amount_binary = $package;
                    while (true) {
                        
                        //lay thang cha trong ban Ml
                        $customer_ml_p_binary = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml['p_binary']);

                        if($customer_first){
                            //kiem tra la customer dau tien vi day la gia tri callback mac dinh
                            if(intval($customer_ml_p_binary['left']) === intval($this-> session->data['customer_id']) )  {
                                //nhanh trai
                                $this -> model_account_pd -> update_pd_binary_vnd(true, $customer_ml_p_binary['customer_id'], $amount_binary );

                                $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'VND Left', '+ ' . number_format($amount_binary) . ' VND', "From ".$customer['username']." Active Package # (".number_format($amount_binary)." VND)");   
                                
                            }else{
                                //nhanh phai
                                $this -> model_account_pd -> update_pd_binary_vnd(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'VND Right', '+ ' . ($amount_binary) . ' VND', "From ".$customer['username']." active Package # (".number_format($amount_binary)." VND)");   
                            }
                            $customer_first = false;
                        }else{
                
                            if(intval($customer_ml_p_binary['left']) === intval($customer_ml['customer_id']) ) {
                                //nhanh trai
                                $this -> model_account_pd -> update_pd_binary_vnd(true, $customer_ml_p_binary['customer_id'], $amount_binary );
                                $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'VND Left', '+ ' . number_format($amount_binary) . ' VND', "From ".$customer['username']." active Package # (".number_format($amount_binary)." VND)");   
                            }else{
                                //nhanh phai
                                $this -> model_account_pd -> update_pd_binary_vnd(false, $customer_ml_p_binary['customer_id'], $amount_binary );
                                $this -> model_account_customer -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'VND Right', '+ ' . number_format($amount_binary) . ' VND', "From ".$customer['username']." active Package # (".number_format($amount_binary)." VND)");   
                            }
                        }
                        if(intval($customer_ml_p_binary['customer_id']) === 1){
                            break;
                        }
                        //lay tiep customer de chay len tren lay thang cha
                        $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml_p_binary['customer_id']);
                    } 
                    // hoa hồng trực tiếp 5%
                    $partent = $this -> model_account_customer ->getCustomer($customer['p_node']);
                    $this -> model_account_customer -> saveTranstionHistory(
                    $partent['customer_id'],
                    'Refferal Commistion', 
                    '+ ' . number_format($package*0.05) . ' VND',
                    "Refferal 5 % from ".$customer['username']." active package (".number_format($package)." VND)",
                    '');  
                    $this -> model_account_pd->update_coinmax($partent['customer_id'],$package*0.05,$add=true);
                    $this -> model_account_pd -> saveTranstionHistory_transaction($partent['customer_id'],$package*0.05,0,$this->get_blance_coinmax($partent['customer_id']), "Refferal 5 % from ".$customer['username']." active package (".number_format($package)." VND)","");
                }
                $json['complete'] = 1;
            }
            else
            {
                $json['no_money'] = -1;
            }
            $this->response->setOutput(json_encode($json));
            
        }

    }
    public function get_blance_coinmax($customer_id){
        $this -> load-> model('account/pd');
        $get_blance_coinmax = $this -> model_account_pd -> get_wallet_coinmax_buy_customer_id($customer_id);
        return $get_blance_coinmax['amount'];
    }
}
