<?php
class ControllerAccountNewuser extends Controller {
	public function index() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');

		};
		
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect(HTTPS_SERVER.'signin.html');
		call_user_func_array("myConfig", array($this));

		if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
		$data['base'] = $server;
        $data['self'] = $this;
        $this -> load -> language('account/personal');
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$data['language']= $getLanguage;
		$language = new Language($getLanguage);
		$language -> load('account/transaction');

		$data['lang'] = $language -> data;


    	$data['user'] = $this -> model_account_customer -> get_all_customer_signup($this->session->data['customer_id']);


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/newuser.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/newuser.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/newuser.tpl', $data));
        }
	}
	public function edituser(){
		$this -> load -> model('account/customer');
		
		!array_key_exists('id', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		$customer_get = $this -> model_account_customer -> getCustomerbyCode($this -> request -> get['id']);
		count($customer_get) === 0 && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
		$data['base'] = $server;
        $data['self'] = $this;
        $data['cus_id'] = $customer_get['customer_code'];
        $ML = $this -> model_account_customer -> getCustomer_IN_ML($customer_get['customer_id']);
        count($ML) > 0 && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
	$data['check_p_binary'] = $this->url->link('account/newuser/get_position', '', 'SSL');
		 if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/edit_user.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/edit_user.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/edit_user.tpl', $data));
        }

	}
	public function get_account_p_binary() {
		if ($this -> customer -> isLogged()) {
			$this -> load -> model('account/customer');

			$tree = explode(',', $this -> model_account_customer -> get_all_customer_p_binary($this->session->data['customer_id']));
			$username = $this -> model_account_customer -> getUserName($this->session->data['customer_id']);
			array_push($tree, $username);

			unset($tree[0]);
			//get customer partent
	
			
			return $tree;
		}
	}

public function get_position($p_binary){
		$this -> load -> model('account/customer');
		$p_binary = $this -> request -> get['pbinary'];

		$check_pbinary = $this -> model_account_customer -> get_customer_Id_by_username($p_binary);

		$check_p_binary = $this -> model_account_customer -> count_p_binary($check_pbinary['customer_id']);
		if (!empty($check_p_binary)) {
			$html ='';
			if (intval($check_p_binary['left']) === 0 && intval($check_p_binary['right']) === 0 ) {
				$html .= '<option value="">-- Choose your Postision --</option>';
	            $html .= '<option value="left">Left</option>';
	            $html .= '<option value="right">Right</option>';
			} elseif (intval($check_p_binary['left']) === 0 && intval($check_p_binary['right']) !== 0 ) {
				$html .= '<option value="">-- Choose your Postision --</option>';
	            $html .= '<option value="left">Left</option>';
	            
			} elseif (intval($check_p_binary['left']) !== 0 && intval($check_p_binary['right']) === 0 ) {
				$html .= '<option value="">-- Choose your Postision --</option>';
	            $html .= '<option value="right">Right</option>';
			}
			$json['html'] = $html;

			
		} else{
			$json['html'] = null;
		}
		$this -> response -> setOutput(json_encode($json));
		
	}
	public function editSubmit(){
		$this -> load -> model('customize/register');
		$this -> load -> model('account/customer');
		
		$json['login'] = $this->customer->isLogged() ? 1 : -1;
        $json['login'] === -1 && die();
        !array_key_exists('postion', $this -> request -> get) && die();
        if ($this->customer->isLogged() && $this->request->get['pbinary'] && $this->request->get['postion']) {
        	$check_p_binary = $this -> model_account_customer -> check_p_binary($this->request->get['pbinary']);
			
			intval($check_p_binary['number']) === 2 && die('Error');

			$this -> model_customize_register -> Join_binary_tree($this->request->get);
			$json['ok'] = 1;
			$json['link']    = HTTPS_SERVER.'column-tree.html';
		}
		
         $this->response->setOutput(json_encode($json));
	}
}