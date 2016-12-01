<?php
class ControllerPdTransaction extends Controller {
	public function index() {
		$this->document->setTitle('Deposit');
		$this->load->model('pd/registercustom');
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_pd_registercustom -> get_count_transaction();

		$ts_history = $ts_history['number'];
		$data['seft'] = $this;
		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('pd/buy', 'page={page}&token='.$this->session->data['token'].'', 'SSL');
		$data['code'] =  $this-> model_pd_registercustom->get_all_transaction($limit, $start);
		$data['pagination'] = $pagination -> render();
		
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('pd/transaction.tpl', $data));
	}

	public function getCustomer_buyid($customer_id){
		$this->load->model('pd/registercustom');

		return $this -> model_pd_registercustom -> getCustomer_buyid($customer_id);
	}
	public function deposit_complete(){
		$this->load->model('pd/registercustom');
		//update trạng thái deposit
		$id = $this->request->get['id'];
		$get_deposit = $this -> model_pd_registercustom -> get_deposit($id);
		if (intval($get_deposit['status'])== 0){
			$this-> model_pd_registercustom -> deposit_complete($id,1);
			//chuyển VNĐ
			$get_deposit = $this -> model_pd_registercustom -> get_deposit($id);

			$this -> model_pd_registercustom -> update_coinmax($get_deposit['customer_id'],$get_deposit['amount'],true);
			$blance_coinmax = $this -> model_pd_registercustom -> get_wallet_coinmax_buy_customer_id($get_deposit['customer_id']);
			$this-> model_pd_registercustom ->saveTranstionHistory($get_deposit['customer_id'], $get_deposit['amount'], 0,$blance_coinmax['amount'],"Deposit ".number_format($get_deposit['amount'])." VNĐ", 0);
			// Lưu lịch sử người chuyển
			$this -> model_pd_registercustom -> saveTranstionHistory_admin($get_deposit['customer_id'],0, $get_deposit['amount'], "Deposit ".$this->get_username($get_deposit['customer_id'])." ".number_format($get_deposit['amount'])." Điểm");
		}
		$this -> response -> redirect("index.php?route=pd/deposit&token=".$this->request->get['token']);
	}
	public function get_username($customer_id){
		$this->load->model('pd/registercustom');
		return $this -> model_pd_registercustom -> get_username($customer_id);
	}
}