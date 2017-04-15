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
        /*$block_io = new BlockIo(key, pin, block_version);
        $data['amount_blockchain'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->available_balance;
        $data['amount_blockchain_pending'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->pending_received_balance;*/
        $paged = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
        $data['get_M_Wallet'] = $this -> model_account_customer -> get_M_Wallet($this -> session -> data['customer_id'])['amount'];
        $data['wallet_token'] = $this -> model_account_customer -> get_sum_token_wallet($this -> session -> data['customer_id']);

        $data['history_coin_wallet_payment'] = $this -> model_account_customer -> history_coin_wallet_payment($this -> session -> data['customer_id']);


        $data['withdrraw_pendding'] = $this -> model_account_customer -> withdrraw_pendding($this -> session -> data['customer_id']);

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

    public function submit_my_transaction(){
        function myCheckLoign($self) {
            return $self -> customer -> isLogged() ? true : false;
        };

        function myConfig($self) {
            
        };
        !call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect("/login.html");
        call_user_func_array("myConfig", array($this));
        $this -> load -> model('account/customer');

        if ($this -> request -> post){
           
            $amount_sfccoin = array_key_exists('amount_sfccoin', $this -> request -> post) ? $_POST['amount_sfccoin'] : "Error";
            $amount_btc = array_key_exists('amount_btc', $this -> request -> post) ? $_POST['amount_btc'] : "Error";
            $password_transaction = array_key_exists('password_transaction_btc', $this -> request -> post) ? $_POST['password_transaction_btc'] : "Error";

            if ($amount_btc == "Error" || $password_transaction == "Error" || $amount_sfccoin == "Error") {
                $json['error'] = -1;
            }
            $check_password_transaction = $this -> model_account_customer -> check_password_transaction($this->session->data['customer_id'],$password_transaction);

            if ($check_password_transaction > 0)
            {
                $get_coin = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
                 
                if ($get_coin['coin'] >= $amount_sfccoin) 
                {

                    $check_date_withdraw = $this -> model_account_customer -> check_date_withdraw($this -> session -> data['customer_id']);

                    if (count($check_date_withdraw) > 0) 
                    {
                        $json['day_withdraw'] = 1;
                        $this->response->setOutput(json_encode($json));
                    }

                    $maxPD  =$this -> model_account_customer -> getmaxPD($this -> session -> data['customer_id']);
                    switch (doubleval($maxPD['number'])) {
                        case 50000000:
                            $percent_r_payment = 0.004;
                           
                            break;
                        case 100000000:
                            $percent_r_payment = 0.008;
                           
                            break;
                        case 500000000:
                            $percent_r_payment = 0.01;
                           
                            break;
                        case 1000000000:
                            $percent_r_payment = 0.015;
                            
                            break;
                        case 2000000000:
                            $percent_r_payment = 0.02;
                           
                            break;
                        case 5000000000:
                            $percent_r_payment = 0.03;
                            break;
                        default:
                            die;
                            break;
                    }

                    if ($amount_sfccoin*0.0008 <= $percent_r_payment)
                    {
                        $this -> model_account_customer -> up_coin_customer($this -> session -> data['customer_id'],$amount_sfccoin,false);
                        $this -> model_account_customer -> in_payment_coin($this -> session -> data['customer_id'],$amount_sfccoin*0.0008*100000000,$amount_sfccoin);

                        $json['succsess'] = 1;
                    }
                    else
                    {
                        $json['max_withdraw'] = $percent_r_payment;
                    }
                }
                else
                {
                    $json['money_transfer'] = 1;
                }
            }
            else
            {
                $json['password'] = -1;
            }
            $this->response->setOutput(json_encode($json));
        }
    }
}