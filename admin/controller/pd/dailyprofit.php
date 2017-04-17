<?php
class ControllerPdDailyprofit extends Controller {
	public function index() {
		error_reporting(0);
		
		$this->document->setTitle('Deposit');
		$this->load->model('pd/registercustom');
		$data['self'] =$this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
		$this -> document -> addScript('../catalog/view/javascript/countdown/jquery.countdown.min.js');
		$this -> document -> addScript('../catalog/view/javascript/transaction/countdown.js');
		

		//update percent
		/*$get_all_dailyprofix_customer = $this -> model_pd_registercustom -> get_all_dailyprofix_customer();
		foreach ($get_all_dailyprofix_customer as $key => $value) {
			if ($value['count_day'] < 30){

				if ($value['pakacge'] == 50000000){
					$percent = 20;
				}
				if ($value['pakacge'] == 100000000){
					$percent = 21;
				}
				if ($value['pakacge'] == 500000000){
					$percent = 22;
				}
				if ($value['pakacge'] == 1000000000){
					$percent = 23;
				}
				if ($value['pakacge'] == 2000000000){
					$percent = 24;
				}
				if ($value['pakacge'] == 5000000000){
					$percent = 25;
				}
			}
			$maxpd = $this -> model_pd_registercustom -> getmaxPD($value['customer_id'])['number'];
			$p_node_pd = $this -> model_pd_registercustom -> getCustomer($value['customer_id'])['p_node_pd'];

			if ($maxpd <= $p_node_pd){
				$chia = 1;
			}
			else
			{
				$chia = 2;
			}
			
			if ($value['count_day'] >= 30 && $value['count_day'] < 45){
				
				if ($value['pakacge'] == 50000000){
					$percent = 18/$chia;
				}
				if ($value['pakacge'] == 100000000){
					$percent = 19/$chia;
				}
				if ($value['pakacge'] == 500000000){
					$percent = 20/$chia;
				}
				if ($value['pakacge'] == 1000000000){
					$percent = 21/$chia;
				}
				if ($value['pakacge'] == 2000000000){
					$percent = 22;
				}
				if ($value['pakacge'] == 5000000000){
					$percent = 23/$chia;
				}
			}

			$maxpd = $this -> model_pd_registercustom -> getmaxPD($value['customer_id'])['number'];
			$p_node_pd = $this -> model_pd_registercustom -> getCustomer($value['customer_id'])['p_node_pd'];

			if ($p_node_pd > $maxpd){
				$chia = 1;
			}
			else
			{
				$chia = 2;
			}
			if ($p_node_pd == 0)
			{
				$chia = 0;
			}

			if ($value['count_day'] >= 45 && $value['count_day'] < 90){
				if ($value['pakacge'] == 50000000){
					$percent = 16/$chia;
				}
				if ($value['pakacge'] == 100000000){
					$percent = 17/$chia;
				}
				if ($value['pakacge'] == 500000000){
					$percent = 18/$chia;
				}
				if ($value['pakacge'] == 1000000000){
					$percent = 19/$chia;
				}
				if ($value['pakacge'] == 2000000000){
					$percent = 20/$chia;
				}
				if ($value['pakacge'] == 5000000000){
					$percent = 21/$chia;
				}
			}
			$this -> model_pd_registercustom -> up_pecent_payment($value['id'],$percent);
		}*/

		$limit = 20;
		$start = ($page - 1) * 20;

		$ts_history = $this -> model_pd_registercustom -> get_count_dailyprofix();
		$data['self'] =  $this;
		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('pd/dailyprofit', 'page={page}&token='.$this->session->data['token'].'', 'SSL');
		$data['code'] =  $this-> model_pd_registercustom->get_all_dailyprofix($limit, $start);

		$data['code_all'] =  $this-> model_pd_registercustom->get_all_dailyprofix_all();
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




		$this->response->setOutput($this->load->view('pd/dailyprofit.tpl', $data));
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

	public function payment_daily(){
		$this->load->model('pd/registercustom');
		$daliprofit = $_POST['daliprofit'];
		$pin = $_POST['pin'];
		$google = $_POST['google'];
		
		if ($this->check_otp_login($google) == 1 ){
			$this -> pay($pin);
			$this -> response -> redirect($this -> url -> link('pd/dailyprofit&token='.$_GET['token'].'#suscces'));
		}
		else{
			$this -> response -> redirect($this -> url -> link('pd/dailyprofit&token='.$_GET['token'].'#no_google'));
		}
		
	}

	public function pay($pin){
		$this->load->model('pd/registercustom');

		$paymentEverdayGroup = $this -> model_pd_registercustom -> get_all_dailyprofix_all();
		//print_r($paymentEverdayGroup); die;
		$amount = '';
		$wallet = '';
		$customer_id = '';
		$first = true;
		$test = '';
		foreach ($paymentEverdayGroup as $key => $value) {
			if($first === true){
				$amount .= round(doubleval($value['amount']),8);
				$wallet .= $value['addres_wallet'];
				$customer_id .= $value['customer_id'];
				$test .=  $value['customer_id']." ---- ".$value['addres_wallet']." ---- ".round(doubleval($value['amount']),8)."<br/>";
				$first = false;
			}else{
				$amount .= ','. round(doubleval($value['amount']),8);
				$wallet .= ','. $value['addres_wallet'];
				$customer_id .= ','. $value['customer_id'];
				$test .=  $value['customer_id']." ---- ".$value['addres_wallet']." ---- ".round(doubleval($value['amount']),8)."<br/>";
			}
		}
		$customer_ids = explode(',', $customer_id);
		$amountS = explode(',',$amount);
		
		echo $test;
		echo $amount;
		echo "<br/>";
		echo $wallet;
		//die('111');
		$block_io = new BlockIo(key,$pin, block_version); 
	            $tml_block = $block_io -> withdraw(array(
	                'amounts' => $amount , 
	                'to_addresses' => $wallet,
	                'priority' => 'low'
	            )); 
	    $txid = $tml_block -> data -> txid;
		for ($i=0; $i < count($customer_ids); $i++) { 
			$this -> model_pd_registercustom -> update_count_day_payment($customer_ids[$i]);
			$this -> model_pd_registercustom -> saveTranstionHistory(
	            	$customer_ids[$i],
	            	'Daily rates', 
	            	'+ ' . $amountS[$i] . ' BTC',
	            	'+'.$amountS[$i].' BTC one day',
	            	'<a target="_blank" href="https://blockchain.info/tx/'.$txid.'" >Link Transfer </a>');
		}

		/*die('aaaaaaaaaaaaaaaaaaaaa');*/

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