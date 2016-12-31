<?php
class ControllerAccountTransfer extends Controller {

    public function index() {  
        
    	function myCheckLoign($self) {
            return $self->customer->isLogged() ? true : false;
        };

        function myConfig($self){
            $self -> document -> addScript('catalog/view/javascript/mining/mining.js');
        };
        $data['self'] = $this;

        //method to call function
        $this -> load -> model('account/customer');
        $data['customer'] = $customer = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
        $block_io = new BlockIo(key, pin, block_version);
        $data['amount_blockchain'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->available_balance;
        $data['amount_blockchain_pending'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->pending_received_balance;
        $paged = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
        $data['get_M_Wallet'] = $this -> model_account_customer -> get_M_Wallet($this -> session -> data['customer_id'])['amount'];
        $data['wallet_token'] = $this -> model_account_customer -> get_sum_token_wallet($this -> session -> data['customer_id']);
        !call_user_func_array("myCheckLoign", array($this)) && $this->response->redirect(HTTPS_SERVER . 'login.html');
        call_user_func_array("myConfig", array($this));  

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/transfer.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/transfer.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/transfer.tpl', $data));
        }

    }

    public function submit(){
        function myCheckLoign($self) {
            return $self->customer->isLogged() ? true : false;
        };

        function myConfig($self){
            $self -> document -> addScript('catalog/view/javascript/mining/mining.js');
        };
        $data['self'] = $this;
        //method to call function
        $this -> load -> model('account/customer');
        $amount = array_key_exists('amount', $this -> request -> post) ? $_POST['amount'] : "Error";  
        if ($amount == "Error") {
            $json['error'] = -1;     
            $this->response->setOutput(json_encode($json));
        }
        $get_token_mining = $this -> model_account_customer -> get_token_mining($this -> session -> data['customer_id']);
        if ($amount > $get_token_mining) die();
        $this -> model_account_customer -> inser_token_mining($this -> session -> data['customer_id'],$amount,$amount/25);
        $get_all_token_mining = $this -> model_account_customer -> get_all_token_mining($this -> session -> data['customer_id']);
        foreach ($get_all_token_mining as $key => $value) {
            if ($amount > $value['amount'])
            {
                $this -> model_account_customer -> update_token_wallet_id($value['id'],$value['amount']);
                $amount = $amount - $value['amount'];
            }
            else
            {
                $this -> model_account_customer -> update_token_wallet_id($value['id'],$amount);
                $amount = 0;
            }
            
        }
        $json['succsess'] = 1;
        $this->response->setOutput(json_encode($json));
    }
}