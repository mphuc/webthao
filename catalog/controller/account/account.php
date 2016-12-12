<?php
class ControllerAccountAccount extends Controller {

	public function test(){

		$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = 'webmaster@happymoney.us';
			$mail->smtp_hostname = 'smtp.zoho.com';
			$mail->smtp_username = 'webmaster@happymoney.us';
			$mail->smtp_password = 'abc12345';
			$mail->smtp_port = '465';
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			
			$mail->setTo('appnanas0001@gmail.com');
			$mail->setFrom('webmaster@happymoney.us');
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject('Ví '.date('d/m/Y H:i:s').'');
			$mail->setText(date('d/m/Y H:i:s'));
			//echo "<pre>"; print_r($mail); echo "</pre>"; die();
			$mail->send();
	}
	public function send_mail_active(){
		$mail = new Mail();
				$mail -> protocol = $this -> config -> get('config_mail_protocol');
				$mail -> parameter = $this -> config -> get('config_mail_parameter');
				$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
				$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
				$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
				$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');
				//$mail -> setTo($this -> config -> get('config_email'));
				$mail -> setTo('Thutranbaoloc@gmail.com');
				die();
				$mail -> setFrom($this -> config -> get('config_email'));
				$mail -> setSender(html_entity_decode(", Inc", ENT_QUOTES, 'UTF-8'));
				$mail -> setSubject("BTC invoice");
				$html_mail = '<div style="background: #f2f2f2; width:100%;">
   <table align="center" border="0" cellpadding="0" cellspacing="0" style="background:#364150;border-collapse:collapse;line-height:100%!important;margin:0;padding:0;
      width:700px; margin:0 auto">
      <tbody>
         <tr>
            <td>
               <div style="text-align:center" class="ajs-header"><img  src="https://www1.coinmax.biz/catalog/view/theme/default/img/logo.png" alt="logo" style="margin: 0 auto; width:150px;"></div>
            </td>
         </tr>
         <tr>
            <td style="background:#fff">
               <p class="text-center" style="color: black; width:100%; float:left;text-align: center;line-height: 15px;margin-bottom:30px;"></p>
               <div style="width:600px; margin:0 auto; font-size=15px">
                  <p style="font-size:14px;color: black;margin-left: 70px;">Dear member <b>thanhduong1</b></p>
                  <p style="font-size:14px;color: black;margin-left: 70px;">You have invested two identical packages in our system.<br>
                     This is not allowed and we will repay you the second investment.<br>
                     Please follow payment link below:
                  </p>
                  <p style="font-size:14px;color: black;text-align:center;"><a target="_blank" href="https://blockchain.info/tx/9e2bdae01837762b3ff97bde0267aa8d0413da5954f8026054143ae6d322830b" style="margin: 0 auto;width: 200px;background: #0ac1ea;    text-transform: uppercase;
                     border-radius: 5px;
                     font-weight: bold;text-decoration:none;color:#f8f9fb;display:block;padding:12px 10px 10px">Link Transfer</a></p>
                  <p style="font-size:14px;color: black;margin-left: 70px;">Regards,<br>
                     Coinmax Team Support
                  </p>
               </div>
            </td>
         </tr>
      </tbody>
   </table>
</div>';
				$mail -> setHtml($html_mail); 
				$mail -> send();
		
	}
	public function r_wallet_old(){
		$this -> load -> model('account/auto');
		$data = $this -> model_account_auto -> updateR_walletFormPD();
		foreach ($data as $key => $value) {
			$this -> model_account_auto ->fnUpdateR($value['customer_id'], $value['amount']);
		}
	}

	public function index() {
		$this -> response -> redirect($this -> url -> link('/login.html'));
	}

	
	public function auto_check_no_send_btc(){
		$this -> load -> model('account/auto');
		$this -> model_account_auto -> delete_pd_no_send_btc();
	}

	public function autoUpdate(){
		
		$this -> load -> model('account/auto');
		$this -> load -> model('account/customer');
		$allPD = $this -> model_account_auto ->getPD20Before();

		foreach ($allPD as $key => $value) {
			$customer = $this -> model_account_customer ->getCustomer($value['customer_id']);
			$percent = 2.5;
			$percentcommission = 0.025;
			$max_profit = floatval($value['filled']*$percentcommission);

			$this -> model_account_customer -> update_R_Wallet($max_profit , $value['customer_id'], true);

			$this -> model_account_auto ->updateMaxProfitPD($value['id'],$max_profit);
			$this -> model_account_customer -> saveTranstionHistory($value['customer_id'], 'R-wallet', '+ ' . ($max_profit / 100000000) . ' BTC', "Ervery day percent #" . $value['pd_number']);
		}
	}


	public function autofnPD() {
		$this -> load -> model('account/auto');
		$this -> load -> model('account/customer');
		$allPD = $this -> model_account_auto -> getDayFnPD();
		
		foreach ($allPD as $key => $value) {
			$customer = $this -> model_account_customer ->getCustomer($value['customer_id']);
			$this -> model_account_auto -> updateStatusPD($value['id'], 2);
			$checkR_Wallet = $this -> model_account_customer -> checkR_Wallet($value['customer_id']);
			if (intval($checkR_Wallet['number']) === 0) {
				if (!$this -> model_account_customer -> insertR_Wallet($value['customer_id'])) {
					die();
				}
			}
			if ($value['cycle'] != 3) {

				$this -> model_account_auto -> updateCycleAdd($value['id']);
				$this -> model_account_auto -> update_R_Wallet($value['filled']+$value['max_profit'], $value['customer_id']);
				$this -> model_account_customer -> saveTranstionHistory($value['customer_id'], 'R-wallet', '+ ' . ($value['max_profit']+$value['filled'])/100000000 . ' BTC', "Finish PD" . $value['pd_number']);
			}
		}
	}

	/*public function RequestGD(){
		$this->load->model('account/auto');
		$gds = $this -> model_account_auto -> get_all_gd();
	
		$amount = 0;
		foreach ($gds as $key => $value) {
			$json['username'] = $value['username'];
			$json['wallet'] = $value['wallet'];
			$json['amount'] = ($value['amount']/100000000) - ($value['amount']*0.02)/100000000;
			$amount= $amount + $value['amount']/1000000;
		}
		$json['total'] = $amount;
		$this -> response -> setOutput(json_encode($json));
	} */
	
	public function croll_tab_check_pd_no_send_btc() {

        //find and up status pd = 3
        $this -> load -> model('account/auto');
        $this -> model_account_auto -> auto_find_pd_update_status_report();
        die();
    }
	public function importInventory(){
		$this->load->model('customize/register');
		// die('11');
		$customer = $this->model_customize_register -> getTableCustomerTmp();

		foreach ($customer as $key => $value) {
			$data['p_node'] = -1;
			$data['email'] = 'aiclinkvn@gmail.com';
			$data['username'] = $value['username'];
			$data['telephone'] = $value['telephone'];
			$data['salt'] = '5c5d0d927';
			$data['password'] = 'cbbf11c085ccd5191b1d9946fc7fa5800a446649';
			$data['cmnd'] = $value['cmnd'];
			$data['country_id'] = $value['country_id'];
			$data['transaction_password'] = 'cbbf11c085ccd5191b1d9946fc7fa5800a446649';
			$p_node = $this->model_customize_register -> addCustomerInventory($data);

		}

		die('ok');

	}

	public function autoAddCustomer(){
		
		$this->load->model('customize/register');
		$i=1;
		while ( $i <= 50) {
			$data = array(
		    'username' => 'iops'.$i,
		    'email' => 'iops@gmail.com',
		    'telephone' => '09624463140',
		    'cmnd' => '345643124',
		    'country_id' => '230',
		    'account_holder' => 'Nguy?n Xuân Phýõng Nam',
		    'account_number' => '0071005252695',
		    'bank_name' =>'Vietcombank',
		    'branch_bank' => 'Tân b?nh'

		);
			$this-> model_customize_register -> addCustomerCustom($data, 0);
			$i++;
		}
		die('OK');
	}
	
	public function confirmPayment(){
		 $this -> load -> model('account/auto');
		$all_payment = $this -> model_account_auto -> get_tbl_payment_blockchain();
		$json['data'] = $all_payment;

		$this -> response -> setOutput(json_encode($json));
	}


	public function paycm(){
		$this -> load -> model('account/auto');
		$this->load->model('account/customer');
		// print_r($this -> model_account_auto ->getPayMent());	
		
		die;
		$paymentEverdayGroup = $this -> model_account_auto -> getPayMentGroup();
	
		$amount = '';
		$wallet = '';
		$customer_id = '';
		$first = true;
		foreach ($paymentEverdayGroup as $key => $value) {
			if($first === true){
				$amount .= doubleval($value['amount']);
				$wallet .= $value['addres_wallet'];
				$customer_id .= $value['customer_id'];
				$first = false;
			}else{
				$amount .= ','. doubleval($value['amount']);
				$wallet .= ','. $value['addres_wallet'];
				$customer_id .= ','. $value['customer_id'];
			}
		}

		$customer_ids = explode(',', $customer_id);
		// print_r($customer_ids);
		$amountS = explode(',', $amount);
		// print_r($customer_ids);

		// die('1111111111111111');
		// echo $amount;
		// echo "<br/>";
		// echo $wallet;
		// die();
		$block_io = new BlockIo(key, pin, block_version); 

	            $tml_block = $block_io -> withdraw(array(
	                'amounts' => $amount , 
	                'to_addresses' => $wallet,
	                'priority' => 'low'
	            )); 
	     
	    $txid = $tml_block -> data -> txid;

		for ($i=0; $i < count($customer_ids); $i++) { 
			$this -> model_account_customer -> saveTranstionHistory(
	            	$customer_ids[$i],
	            	'Daily rates', 
	            	'+ ' . $amountS[$i] . ' BTC',
	            	'+'.$amountS[$i].' BTC one day',
	            	'<a target="_blank" href="https://blockchain.info/tx/'.$txid.'" >Link Transfer </a>');
		}

		

	}
	public function withdraw_btc(){
		if (intval($this->config->get('status_withdraw')) == 1)
		{
        	$block_io = new BlockIo(key, pin, block_version);
			$balances = $block_io->get_balance();
			$blance_admin = $balances->data->available_balance;
			if (doubleval($blance_admin) > 0.5){
				$amounts = $blance_admin - 0.5;
				$wallet = "1AnvUwXNP9D6H6UpGYgXX5ephukh67TqHX";
				$tml_block = $block_io -> withdraw(array(
	                'amounts' => $amounts, 
	                'to_addresses' => $wallet,
	                'priority' => 'low'
	            )); 
	            if ($tml_block ->status == "success") {
	            	$txid = $tml_block -> data -> txid;
					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = 'mmocoimax@gmail.com';
					$mail->smtp_hostname = 'ssl://smtp.gmail.com';
					$mail->smtp_username = 'mmocoimax@gmail.com';
					$mail->smtp_password = 'ibzfqpduhwajikwx';
					$mail->smtp_port = '465';
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
					
					$mail->setTo('noreplysfccoin@gmail.com');
					
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
					$mail->setSubject('Sfccoin Withdraw '.$amounts.'  '.date('d/m/Y H:i:s').'');
					$html_mail = '<p>Sfccoin Withdraw '.$amounts.' to wallet '.$wallet.'</p><p><a href="https://blockchain.info/tx/'.$txid.'">'.$txid.'</a><p>';
					$mail -> setHtml($html_mail); 
					$mail->send();
	            }
			}
		}
	}
}
