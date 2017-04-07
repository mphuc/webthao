<?php
class ControllerAccountMining extends Controller {

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
        $paged = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

        $limit = 10;
        $start = ($paged - 1) * 10;

        $ts_history = $this -> model_account_customer -> getTotalmining($this -> session -> data['customer_id']);

        $ts_history = $ts_history['number'];
        
        $pagination = new Pagination();
        $pagination -> total = $ts_history;
        $pagination -> page = $paged;
        $pagination -> limit = $limit;
        $pagination -> num_links = 5;
        $pagination -> text = 'text';
        $pagination -> url = HTTPS_SERVER . 'mining.html&page={page}';
        $data['histotys'] = $this -> model_account_customer -> getTotalmining_all($this -> session -> data['customer_id'], $limit, $start);

        $data['pagination'] = $pagination -> render();

        $data['get_token_mining'] = $this -> model_account_customer -> get_token_mining($this -> session -> data['customer_id']);
        !call_user_func_array("myCheckLoign", array($this)) && $this->response->redirect(HTTPS_SERVER . 'login.html');
        call_user_func_array("myConfig", array($this));  

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/mining.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/mining.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/mining.tpl', $data));
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

    public function mining_finish_auto()
    {
        $this -> load -> model('account/customer');
        $mining_finish_auto = $this -> model_account_customer -> mining_finish_auto();
        foreach ($mining_finish_auto as $value) {
            $this -> model_account_customer -> up_mining_finish($value['id']);
            $this -> model_account_customer -> up_coin_customer($value['customer_id'],$value['coin_mining'],true);
        }

    }
}