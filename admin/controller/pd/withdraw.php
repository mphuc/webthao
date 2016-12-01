<?php
class ControllerPdWithdraw extends Controller {
	public function index() {
		$this->document->setTitle('Deposit');
		$this -> document -> addScript('../catalog/view/javascript/countdown/jquery.countdown.min.js');
		$this -> document -> addScript('../catalog/view/javascript/transaction/countdown.js');
		$this->load->model('pd/registercustom');
		$data['self'] = $this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_pd_registercustom -> get_count_withdraw();

		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('pd/withdraw', 'page={page}&token='.$this->session->data['token'].'', 'SSL');
		$data['code'] =  $this-> model_pd_registercustom->get_all_withdraw($limit, $start);
		$data['pagination'] = $pagination -> render();
		
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('pd/withdraw.tpl', $data));
	}
	
	public function withdraw_complete(){
		$this->load->model('pd/registercustom');
		//update trạng thái deposit
		$id = $this->request->get['id'];
		$get_deposit = $this -> model_pd_registercustom -> get_withdraw($id);
		if (intval($get_deposit['status'])== 0){
			$this-> model_pd_registercustom -> withdraw_complete($id,1);
			//chuyển VNĐ
			$this -> model_pd_registercustom -> update_coinmax($get_deposit['customer_id'],$get_deposit['amount'],false);
			$blance_coinmax = $this -> model_pd_registercustom -> get_wallet_coinmax_buy_customer_id($get_deposit['customer_id']);
			$this-> model_pd_registercustom ->saveTranstionHistory($get_deposit['customer_id'],0,$get_deposit['amount'],$blance_coinmax['amount'],"Get out ".number_format($get_deposit['amount'])." VND", 0);
			// Lưu lịch sử người chuyển
			$this -> model_pd_registercustom -> saveTranstionHistory_admin($get_deposit['customer_id'],0, $get_deposit['amount'], "Withdraw ".$this->get_username($get_deposit['customer_id'])." ".number_format($get_deposit['amount'])." VND");
		}
		$this -> response -> redirect("index.php?route=pd/withdraw&token=".$this->request->get['token']);
	}
	public function admin_finish(){
		$this->load->model('pd/registercustom');
		//update trạng thái deposit
		$id = $this->request->get['id'];
		$get_deposit = $this -> model_pd_registercustom -> get_withdraw($id);
		$this -> model_pd_registercustom -> update_withdraw_pd($id,1);
		$this -> response -> redirect("index.php?route=pd/withdraw&token=".$this->request->get['token']);
	}

	public function get_username($customer_id){
		$this->load->model('pd/registercustom');
		return $this -> model_pd_registercustom -> get_username($customer_id);
	}
	public function get_username_all($customer_id){
		$this->load->model('pd/registercustom');
		return $this -> model_pd_registercustom -> get_username_all($customer_id);
	}
}