<?php
class ControllerPdDeposit extends Controller {
	public function index() {
		$this->document->setTitle('Deposit');
		$this->load->model('pd/registercustom');
		$data['self'] =$this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
		$this -> document -> addScript('../catalog/view/javascript/countdown/jquery.countdown.min.js');
		$this -> document -> addScript('../catalog/view/javascript/transaction/countdown.js');
		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_pd_registercustom -> get_count_code();

		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('pd/deposit', 'page={page}&token='.$this->session->data['token'].'', 'SSL');
		$data['code'] =  $this-> model_pd_registercustom->get_all_code($limit, $start);
		$data['pagination'] = $pagination -> render();
		
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('pd/deposit.tpl', $data));
	}
	public function get_username_all($customer_id){
		$this->load->model('pd/registercustom');
		return $this -> model_pd_registercustom -> get_username_all($customer_id);
	}
	public function deposit_complete(){
		$this->load->model('pd/registercustom');
		//update trạng thái deposit
		$id = $this->request->get['id'];
		$get_deposit = $this -> model_pd_registercustom -> get_deposit($id);
		if (intval($get_deposit['status_gd'])== 0){
			$this-> model_pd_registercustom -> deposit_complete($id,1);
			//chuyển VNĐ
			$get_deposit = $this -> model_pd_registercustom -> get_deposit($id);

			$this -> model_pd_registercustom -> update_coinmax($get_deposit['customer_id'],$get_deposit['amount'],true);
			$blance_coinmax = $this -> model_pd_registercustom -> get_wallet_coinmax_buy_customer_id($get_deposit['customer_id']);
			$this-> model_pd_registercustom ->saveTranstionHistory($get_deposit['customer_id'], $get_deposit['amount'], 0,$blance_coinmax['amount'],"Get In".number_format($get_deposit['amount'])." VNĐ", 0);
			// Lưu lịch sử người chuyển
			$this -> model_pd_registercustom -> saveTranstionHistory_admin($get_deposit['customer_id'],0, $get_deposit['amount'], "Deposit ".$this->get_username($get_deposit['customer_id'])." ".number_format($get_deposit['amount'])." VND");
		}

		$this -> response -> redirect("index.php?route=pd/deposit&token=".$this->request->get['token']);
	}

	public function deposit_admin_help(){
		$this->load->model('pd/registercustom');
		//update trạng thái deposit
		$id = $this->request->get['id'];
		$get_deposit = $this -> model_pd_registercustom -> get_deposit($id);
		if (intval($get_deposit['status_gd'])== 0){
			$this-> model_pd_registercustom -> deposit_complete($id,1);
			//chuyển VNĐ
			$get_deposit = $this -> model_pd_registercustom -> get_deposit($id);

			$this -> model_pd_registercustom -> update_coinmax($get_deposit['customer_id'],$get_deposit['amount'],true);
			$this -> model_pd_registercustom -> update_coinmax($get_deposit['user_deposit'],$get_deposit['amount'],false);
			$blance_coinmax_pd = $this -> model_pd_registercustom -> get_wallet_coinmax_buy_customer_id($get_deposit['customer_id']);
			$blance_coinmax_gd = $this -> model_pd_registercustom -> get_wallet_coinmax_buy_customer_id($get_deposit['user_deposit']);

			$this-> model_pd_registercustom ->saveTranstionHistory($get_deposit['customer_id'], $get_deposit['amount'], 0,$blance_coinmax_pd['amount'],"Get In ".number_format($get_deposit['amount'])." VNĐ", 0);

			$this-> model_pd_registercustom ->saveTranstionHistory($get_deposit['user_deposit'], 0, $get_deposit['amount'],$blance_coinmax_gd['amount'],"Get In Help ".number_format($get_deposit['amount'])." VNĐ", 0);
			// Lưu lịch sử người chuyển
			/*$this -> model_pd_registercustom -> saveTranstionHistory_admin($get_deposit['customer_id'],0, 0, "Deposit ".$this->get_username($get_deposit['customer_id'])." ".number_format($get_deposit['amount'])." VND");*/
			// khóa tài khoản
			$this -> model_pd_registercustom -> block_account($get_deposit['user_deposit']);
		}

		$this -> response -> redirect("index.php?route=pd/deposit&token=".$this->request->get['token']);
	}

	public function get_username($customer_id){
		$this->load->model('pd/registercustom');
		return $this -> model_pd_registercustom -> get_username($customer_id);
	}
	
}