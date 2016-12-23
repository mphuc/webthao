<?php
class ControllerPdParingbonus extends Controller {
	public function index() {
		
		$this->document->setTitle('Deposit');
		$this->load->model('pd/registercustom');
		$data['self'] =$this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
		$this -> document -> addScript('../catalog/view/javascript/countdown/jquery.countdown.min.js');
		$this -> document -> addScript('../catalog/view/javascript/transaction/countdown.js');
		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_pd_registercustom -> get_count_paringbonus();
		$data['self'] =  $this;
		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('pd/paringbonus', 'page={page}&token='.$this->session->data['token'].'', 'SSL');
		$data['code'] =  $this-> model_pd_registercustom->get_all_paringbonus($limit, $start);
		$data['code_all'] =  $this-> model_pd_registercustom->get_all_paringbonus_all();
		$data['pagination'] = $pagination -> render();
		$block_io = new BlockIo(key, pin, block_version);
		$balances = $block_io->get_balance();
		$data['wallet'] = wallet; 
		$data['blance_blockio'] = $balances->data->available_balance;
		$data['blance_blockio_pending'] = $balances->data->pending_received_balance;


		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('pd/paringbonus.tpl', $data));
	}
	
	public function get_username($customer_id){
		$this->load->model('pd/registercustom');
		return $this -> model_pd_registercustom -> get_username($customer_id);
	}
	public function get_blance_coinmax($customer_id){
		$this->load->model('pd/registercustom');
		$get_blance_coinmax = $this -> model_pd_registercustom -> get_wallet_coinmax_buy_customer_id($customer_id);
		return $get_blance_coinmax['amount'];
	}

	public function pay_paringbounus(){
		
		$this->load->model('pd/registercustom');
		$daliprofit = $_POST['daliprofit'];
		$pin = $_POST['pin'];
		$google = $_POST['google'];
		
		if ($this->check_otp_login($google) == 1){
			$this -> team_commission($pin);
			$this -> response -> redirect($this -> url -> link('pd/paringbonus&token='.$_GET['token'].'#suscces'));
		}
		else{
			$this -> response -> redirect($this -> url -> link('pd/paringbonus&token='.$_GET['token'].'#no_google'));
		}
		
	}

	public function team_commission($pin){
        
        $this->load->model('pd/registercustom');
        /*TÍNH HOA HỒNG NHÁNH YẾU*/
        $this -> model_pd_registercustom -> delete_form_cn_payment();
        $getCustomer = $this -> model_pd_registercustom -> getCustomer_commission();

        $bitcoin = "";
        $wallet = "";
        $inser_history = "";
        $test = "";
        $amount_tai = "";
        $amount_tra = "";
        $customer_id = "";
        $sum = 0;
       foreach ($getCustomer as $value) {
       
	        if ((doubleval($value['total_pd_left']) > 0 && doubleval($value['total_pd_right'])) > 0)
	        {
	            if (doubleval($value['total_pd_left']) > doubleval($value['total_pd_right'])){
	                $balanced = doubleval($value['total_pd_right']);
	            }
	            else
	            {
	                $balanced = doubleval($value['total_pd_left']);
	            }
	            if ($value['level'] == 2) {
	            	
	            
		            $precent = 10;
		          	
		            $getTotalPD = $this-> model_pd_registercustom -> getmaxPD($value['customer_id']);
		           
		            $amount = ($balanced*$precent)/100;

		            if (doubleval($amount) > (doubleval($getTotalPD['number'])*2))
		            {
		                $amount = (doubleval($getTotalPD['number']))*2;
		            }
		            
	                $sum += round(doubleval($amount)/100000000*0.75*0.97,8);
	                
	                $btc_tra = round(doubleval($amount)/100000000*0.75*0.97,8);
	                $btc_tai = round(doubleval($amount)/100000000*0.25,8);
	                
	                $customer_id .= ','. $value['customer_id'];
	                $amount_tra .= ",".round(doubleval($amount)/100000000*0.75*0.97,8);
	    			$amount_tai .= ",".round(doubleval($amount)/100000000*0.25,8);

	               
	                $bitcoin .= ",".$btc_tra;
	                $wallet .= ",".$value['wallet'];
	                $test .= $btc_tra." -------- ".$value['wallet']." --------- ".$value['customer_id']."------".$amount."<br/>";
	                $this -> model_pd_registercustom ->update_cn_Wallet_payment($amount,$value['customer_id'],$value['wallet']);
	                
	            
	            }
	        }    
	    }
	    echo  $test;
	    echo "<br>";
	    $bitcoin = substr($bitcoin,1);
	    $wallet = substr($wallet,1);
	    echo $bitcoin;
	    echo "<br>";
	    echo $wallet;
	    
	    $customer_ids = explode(',', substr($customer_id,1));
		$amount_tras = explode(',',substr($amount_tra,1));
		$amount_tais = explode(',',substr($amount_tai,1));
			
	    
	    $block_io = new BlockIo(key, $pin, block_version); 

	    $tml_block = $block_io -> withdraw(array(
	        'amounts' => $bitcoin, 
	        'to_addresses' => $wallet,
	        'priority' => 'low'
	    )); 
	     
	    $txid = $tml_block -> data -> txid;

	    $url = '<a target="_blank" href="https://blockchain.info/tx/'.$txid.'" >Link Transfer </a>';
		
	    
	    foreach ($getCustomer as $value) {
       
	        if ((doubleval($value['total_pd_left']) > 0 && doubleval($value['total_pd_right'])) > 0)
	        {
	            if (doubleval($value['total_pd_left']) > doubleval($value['total_pd_right'])){
	                $balanced = doubleval($value['total_pd_right']);
	                $this -> model_pd_registercustom -> update_total_pd_left(doubleval($value['total_pd_left']) - doubleval($value['total_pd_right']), $value['customer_id']);
	                $this -> model_pd_registercustom -> update_total_pd_right(0, $value['customer_id']);
	            }
	            else
	            {
	               $balanced = doubleval($value['total_pd_left']);
	               $this -> model_pd_registercustom -> update_total_pd_right(doubleval($value['total_pd_right']) - doubleval($value['total_pd_left']), $value['customer_id']);
	               $this -> model_pd_registercustom -> update_total_pd_left(0, $value['customer_id']);
	            }
	            $precent = 10;
	            $amount = ($balanced*$precent)/100;
	            $btc_tra = round(doubleval($amount)/100000000*0.75*0.97,8);
	            $inser_history .= ",".$this -> model_pd_registercustom -> inser_history('+ '.($btc_tra).' BTC','System Commission','Earn '.$precent.'%  weak team ('.($balanced/100000000).' BTC), Free 3%. 25% Reinvestment ',$value['customer_id']);
	        }
	    }
	    $this ->model_pd_registercustom->update_transhistory(substr($inser_history,1),$url);
	    for ($i=0; $i < count($customer_ids); $i++) { 
	    	 $this -> model_pd_registercustom -> update_m_Wallet_add_sub($amount_tais[$i]*100000000 , $customer_ids[$i], $add = true);
	    }

    }
	public function check_otp_login($otp){
		require_once dirname(__FILE__) . '/vendor/autoload.php';
		$authenticator = new PHPGangsta_GoogleAuthenticator();
		$secret = "FS34YT4LS76RDZIY";
		$tolerance = "3";
		$checkResult = $authenticator->verifyCode($secret, $otp, $tolerance);    
		if ($checkResult) 
		{
		    return 1;
		     
		} else {
		    return 2;
		}

	}
}