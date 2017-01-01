<?php
class ControllerAccountForgotten extends Controller {
	private $error = array();

	public function index() {
		

		if ($this->customer->isLogged()) {
			$this->response->redirect(HTTPS_SERVER . 'login.html');
		}

		$this -> document -> addScript('catalog/view/javascript/forgot/forgot.js');
		$this->load->language('account/forgotten');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/customer');


		$getLanguage = 'english';

		$language = new Language($getLanguage);
		$language -> load('account/forgotten');
		$data['lang'] = $language -> data;
		$data['getLanguage'] = $getLanguage;


		if (($this->request->server['REQUEST_METHOD'] === 'POST') && $this->validate()) {

			$this->load->language('mail/forgotten');
			$customer_info = $this->model_account_customer->getCustomerByUsername($this->request->post['email']);
			

			$password = substr(sha1(uniqid(mt_rand(), true)), 0, 30);

			$this->model_account_customer->editPasswordCustomForEmail($customer_info, $password);

			/*$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

			$message  = sprintf($this->language->get('text_greeting'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";
			$message .= $this->language->get('text_password') . "\n\n";
			$message .= $password;



			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($customer_info['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject($subject);
			$mail->setText($message);
			$mail->send();*/


			$mail = new Mail();
			$mail -> protocol = $this -> config -> get('config_mail_protocol');
			$mail -> parameter = $this -> config -> get('config_mail_parameter');
			$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
			$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
			$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
			$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');

			//$mail -> setTo($this -> config -> get('config_email'));
			$mail -> setTo($customer_info['email']);
			$mail -> setFrom($this -> config -> get('config_email'));
			$mail -> setSender(html_entity_decode("Sfccoin.com", ENT_QUOTES, 'UTF-8'));
			$mail -> setSubject("Smart Financial Connections - New Password For Login");
			$html_mail = '<div style="background: #f2f2f2; width:100%;">
			   <table align="center" border="0" cellpadding="0" cellspacing="0" style="background:#2A363C;border-collapse:collapse;line-height:100%!important;margin:0;padding:0;
			    width:700px; margin:0 auto">
			   <tbody>
			      <tr>
			        <td>
			          <div style="text-align:center" class="ajs-header"><img  src="'.HTTPS_SERVER.'catalog/view/theme/default/img/logo.png" alt="logo" style="margin: 0 auto; width:150px;"></div>
			        </td>
			       </tr>
			       <tr>
			       <td style="background:#fff">
			       	<p class="text-center" style="font-size:20px;color: black;text-transform: uppercase; width:100%; float:left;text-align: center;margin: 30px 0px 0 0;margin-bottom:30px;">Reset password transaction<p>
			       		
			       		<p style="font-size:14px;color: black;margin-left: 70px;">Hi <b>'.$customer_info['username'].' !</b></p>

				       	<p style="font-size:14px;color: black;margin-left: 70px;margin-bottom:60px;">Your new password is: <b>'.$password.'</b></p>
				      
				          </div>
			       </td>
			       </tr>
			    </tbody>
			    </table>
			  </div>';
			$mail -> setHtml($html_mail); 
			$this->session->data['success'] = $this->language->get('text_success');

			// Add to activity log
			

			if ($customer_info) {
				$this->load->model('account/activity');

				$activity_data = array(
					'customer_id' => $customer_info['customer_id'],
					'name'        => $customer_info['firstname'] . ' ' . $customer_info['lastname']
				);

				$this->model_account_activity->addActivity('forgotten', $activity_data);
			}

			$this->response->redirect(HTTPS_SERVER . 'login.html');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_forgotten'),
			'href' => $this->url->link('account/forgotten', '', 'SSL')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_your_email'] = $this->language->get('text_your_email');
		$data['text_email'] = $this->language->get('text_email');

		$data['entry_email'] = $this->language->get('entry_email');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_back'] = $this->language->get('button_back');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['action'] = HTTPS_SERVER . 'forgot';

		$data['back'] = HTTPS_SERVER . 'login';

		// $data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/forgotten.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/forgotten.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/forgotten.tpl', $data));
		}
	}

	protected function validate() {


	
			$getLanguage = 'english';
		

		$language = new Language($getLanguage);
		$language -> load('account/forgotten');
		$lang = $language -> data;
	
		if (!isset($this->request->post['email'])) {
			$this->error['warning'] = $lang['error_email'];
		} elseif (!$this->model_account_customer->getCustomerByUsername($this->request->post['email'])) {
			$this->error['warning'] = $lang['error_email'];
		}

		return !$this->error;
	}

	public function resetPasswdTran(){
		if ($this -> customer -> isLogged() && $this -> request -> get['id']) {
			
			$this->load->model('account/customer');
			$this->load->language('account/forgotten');
			$this->load->language('mail/forgotten');

			$customer_info = $this->model_account_customer->getCustomer($this -> request -> get['id']);

			$password = substr(sha1(uniqid(mt_rand(), true)), 0, 30);

			$this->model_account_customer->editPasswordTransactionCustomForEmail($customer_info, $password);

			$subject = sprintf('Sfccoin - New transaction Password', html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

			$message  = sprintf('A new transaction password was requested from Sfccoin.com', html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";
			$message .= 'Your new password is:' . "\n\n";
			$message .= $password;

			

			$mail = new Mail();
			$mail -> protocol = $this -> config -> get('config_mail_protocol');
			$mail -> parameter = $this -> config -> get('config_mail_parameter');
			$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
			$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
			$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
			$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');

			//$mail -> setTo($this -> config -> get('config_email'));
			$mail -> setTo($customer_info['email']);
			$mail -> setFrom($this -> config -> get('config_email'));
			$mail -> setSender(html_entity_decode("Sfccoin.com", ENT_QUOTES, 'UTF-8'));
			$mail -> setSubject("Smart Financial Connections - New transaction Password");
			$html_mail = '<div style="background: #f2f2f2; width:100%;">
			   <table align="center" border="0" cellpadding="0" cellspacing="0" style="background:#2A363C;border-collapse:collapse;line-height:100%!important;margin:0;padding:0;
			    width:700px; margin:0 auto">
			   <tbody>
			      <tr>
			        <td>
			          <div style="text-align:center" class="ajs-header"><img  src="'.HTTPS_SERVER.'catalog/view/theme/default/img/logo.png" alt="logo" style="margin: 0 auto; width:150px;"></div>
			        </td>
			       </tr>
			       <tr>
			       <td style="background:#fff">
			       	<p class="text-center" style="font-size:20px;color: black;text-transform: uppercase; width:100%; float:left;text-align: center;margin: 30px 0px 0 0;margin-bottom:30px;">Reset password transaction<p>
			       		
			       		<p style="font-size:14px;color: black;margin-left: 70px;">Hi <b>'.$customer_info['username'].' !</b></p>

				       	<p style="font-size:14px;color: black;margin-left: 70px;margin-bottom:60px;">Your new password is: <b>'.$password.'</b></p>
				      
				          </div>
			       </td>
			       </tr>
			    </tbody>
			    </table>
			  </div>';
			$mail -> setHtml($html_mail); 
			$mail->send();
			$json['ok'] = 1;
			$this -> response -> setOutput(json_encode($json));
		}
	}
}