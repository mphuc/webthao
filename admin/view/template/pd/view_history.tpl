<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>Lịch sử giao dịch </h1>

  </div>
</div>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title pull-left">Lịch sử giao dịch | <?php print_r($customer['firstname']);?></h3>
      
      <div class="clearfix">
          
      </div>
    </div>
    <div class="panel-body">
    <div id="exTab2" class="container"> 
    <ul class="nav nav-tabs">
          <li class="active">
            <a  href="#1" data-toggle="tab">Hoa hồng trực tiếp</a>
          </li>
          <li><a href="#2" data-toggle="tab">Danh sách bảo trợ</a>
          </li>
          <li><a href="#3" data-toggle="tab">Hoa hồng cân nhánh</a>
          </li>
          <li><a href="#4" data-toggle="tab">Hoa hồng cộng hưởng</a>
          </li>
          <li><a href="#5" data-toggle="tab">Lãi tĩnh</a>
          </li>
          <li><a href="#6" data-toggle="tab">Doanh Trái phải</a>
          </li>
          <li><a href="#7" data-toggle="tab">DS Con</a>
          </li>
        </ul>
        <div class="tab-content ">
          <div class="tab-pane active" id="1">
            
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>STT</th>
                  <th>Username</th>
                  <th>Họ tên</th>
                  <th>Số tiền Rút</th>
                  
                  <th>Thời gian</th>
                  <th>Mô tả</th>
                </tr>
              </thead>
              <tbody>
                <?php 
                  //print_r($history);
                  $i =1;
                  foreach ($history as $value) {
                    $i ++;

                    if ($value['wallet'] == "Rút hàng ngày" || $value['wallet'] == "Rút Hoa Hồng Trực Tiếp") {;     
                ?>
                <tr>
                  <td><?php echo $i;?></td>
                  <td><?php echo $value['username'];?></td>
                  <td><?php echo $value['firstname'];?></td>
                  <td><?php echo $value['text_amount'];?></td>
                  <td><b><?php echo date('d/m/Y H:i:s',strtotime($value['date_added']));?></b></td>
                  <td><?php echo $value['system_decsription'];?></td>
                </tr>
                <?php
                    }
                  }
                ?>
              </tbody>
            </table>
          </div>
          <div class="tab-pane" id="2">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>STT</th>
                  <th>Username</th>
                  <th>Họ tên</th>
                  <th>Thời gian tham gia</th>
                  <th>Gói đầu tư</th>
                  <th>HTTT</th>
                  <th>Tiền trả trực tiếp</th>
                </tr>
              </thead>
              <tbody>
                <?php 
                  //print_r($baotro);
                  $i =1;
                  $tong = 0;
                  foreach ($baotro as $value_baotro) {
                    $i ++;
                    $tong += $seft->get_hhtructiep($seft->get_pakege_cha($_GET['customer_id']),$value_baotro['package'])*0.8;
                ?>

                <tr>
                  <td><?php echo $i;?></td>
                  <td><?php echo $value_baotro['username'];?></td>
                  <td><?php echo $value_baotro['firstname'];?></td>
                  <td><b><?php echo date('d/m/Y H:i:s',strtotime($value_baotro['date_register_tree']));?></b></td>
                  <td><?php echo number_format($seft->get_goidautu($value_baotro['customer_id']));?> VNĐ</td>
                  <?php 

                  ?>
                  <td><?php echo number_format($seft->get_hhtructiep($seft->get_pakege_cha($_GET['customer_id']),$value_baotro['package'])) ?> VNĐ</td>
                  <td><?php echo number_format($seft->get_hhtructiep($seft->get_pakege_cha($_GET['customer_id']),$value_baotro['package'])*0.8) ?> VNĐ</td>

                </tr>
                <?php
                   
                  }

                ?>
                <tr>
                  <td colspan="6" class="text-right"><b>Tổng</b></td><td><b><?php echo number_format($tong);?></b> VNĐ</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="tab-pane" id="3">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>STT</th>
                  <th>Username</th>
                  <th>Họ tên</th>
                  <th>Số tiền Rút</th>
                  
                  <th>Thời gian</th>
                  <th>Mô tả</th>
                </tr>
              </thead>
              <tbody>
                <?php 
                 // print_r($history);// hoa hồng cân nhánh
                  $i =1;
                  foreach ($history as $value) {
                    $i ++;

                    if ($value['wallet'] == "Rút Hoa hồng nhánh yếu sau 15 ngày") {;
                      
                ?>

                <tr>
                  <td><?php echo $i;?></td>
                  <td><?php echo $value['username'];?></td>
                  <td><?php echo $value['firstname'];?></td>
                  <td><?php echo $value['text_amount'];?></td>
                  <td><b><?php echo date('d/m/Y H:i:s',strtotime($value['date_added']));?></b></td>
                  <td><?php echo $value['system_decsription'];?></td>
                </tr>
                <?php
                    }
                  }
                ?>
              </tbody>
            </table>
          </div>
          <div class="tab-pane" id="4">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>STT</th>
                  <th>Username</th>
                  <th>Họ tên</th>
                  <th>Số tiền</th>
                  
                  <th>Thời gian</th>
                  <th>Mô tả</th>
                </tr>
              </thead>
              <tbody>
                <?php 
                  //print_r($history);Cộng hưởng
                  $i =1;
                  foreach ($history as $value) {
                    $i ++;

                    if ($value['wallet'] == "Cộng hưởng") {;
                      
                ?>

                <tr>
                  <td><?php echo $i;?></td>
                  <td><?php echo $value['username'];?></td>
                  <td><?php echo $value['firstname'];?></td>
                  <td><?php echo $value['text_amount'];?></td>
                  <td><b><?php echo date('d/m/Y H:i:s',strtotime($value['date_added']));?></b></td>
                  <td><?php echo $value['system_decsription'];?></td>
                </tr>
                <?php
                    }
                  }
                ?>
              </tbody>
            </table>
          </div>
          <div class="tab-pane" id="5">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>STT</th>
                  <th>Username</th>
                  <th>Họ tên</th>
                  <th>Số tiền</th>
                  
                  <th>Thời gian</th>
                  <th>Mô tả</th>
                </tr>
              </thead>
              <tbody>
                <?php 
                  //print_r($history);Lãi hằng ngày
                  $i =1;
                  foreach ($history as $value) {
                    $i ++;

                    if ($value['wallet'] == "Lãi hằng ngày") {;
                      
                ?>

                <tr>
                  <td><?php echo $i;?></td>
                  <td><?php echo $value['username'];?></td>
                  <td><?php echo $value['firstname'];?></td>
                  <td><?php echo $value['text_amount'];?></td>
                  <td><b><?php echo date('d/m/Y H:i:s',strtotime($value['date_added']));?></b></td>
                  <td><?php echo $value['system_decsription'];?></td>
                </tr>
                <?php
                    }
                  }
                ?>
              </tbody>
            </table>
          </div>
          <div class="tab-pane" id="6">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>STT</th>
                  <th>Username</th>
                  <th>Họ tên</th>
                  <th>Trái/Phải</th>
                  <th>Số tiền</th>
                  
                  <th>Thời gian</th>
                  <th>Mô tả</th>
                </tr>
              </thead>
              <tbody>
                <?php 
                  //print_r($history);Lãi hằng ngày
                  $i =1;
                  foreach ($history as $value) {
                    $i ++;

                    if ($value['wallet'] == "Doanh thu nhánh phải" || $value['wallet'] == "Doanh thu nhánh Trái") {;
                      
                ?>

                <tr>
                  <td><?php echo $i;?></td>
                  <td><?php echo $value['username'];?></td>
                  <td><?php echo $value['firstname'];?></td>
                  <td><?php echo $value['wallet'];?></td>
                  <td><?php echo $value['text_amount'];?></td>
                  <td><b><?php echo date('d/m/Y H:i:s',strtotime($value['date_added']));?></b></td>
                  <td><?php echo $value['system_decsription'];?></td>
                </tr>
                <?php
                    }
                  }
                ?>
              </tbody>
            </table>
          </div>
          <div class="tab-pane" id="7">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th>TT</th>
                  <th>Username</th>
                  <th>Họ Tên</th>
                  <th>Gói đầu tư</th>
                  <th>Ngày đầu tư</th>
                  <th>Tổng nhánh trái / phải</th>
                  <th>Người bảo trợ</th>
                  <th>Lịch sử</th>
                  <th>Sửa</th>
                </tr>
              </thead>
                <tbody>
                  <?php $i = 1;
                  //print_r($get_name_customer); die;
                foreach ($get_name_customer as $value) {
                  $get_filled_by_id = $seft -> model_pd_registercustom -> get_filled_by_id($value['customer_id']);
                ?>
                  <tr>
                    <td><?php echo $i++;?></td>
                    <td><?php echo $value['username'];?></td>
                    <td><?php echo $value['firstname'];?></td>
                    <td><?php echo number_format($get_filled_by_id['sum_filled']);?></td>
                    <td><?php echo $value['date_register_tree'];?></td>
                    <td><?php echo number_format($value['total_pd_left'])."/".number_format($value['total_pd_right']);?></td>
                    <td><?php echo $seft->getCustomer($value['p_node']);?></td>
                    <td class="text-center"><a href="<?php echo $this->url->link('pd/history/view_history&customer_id='.$value['customer_id'].'&token='.$this->session->data['token']);?>"><button class="btn btn-success"><i class="fa fa-external-link" aria-hidden="true"></i></button></a></td>
                    <td class="text-center"><a href="<?php echo $this->url->link('pd/history/edit_user&customer_id='.$value['customer_id'].'&token='.$this->session->data['token']);?>"><button class="btn btn-primary  "><i class="fa fa-eyedropper" aria-hidden="true"></i></button></a></td> 
                    <?php if ($_SESSION['user_id'] == 1 || $_SESSION['user_id'] == 11) {?>
                    <td><a target="_blank" href="<?php echo $this->url->link('pd/personalcustom&id='.$value['customer_id'].'&token='.$this->session->data['token']);?>"><i class="fa fa-line-chart" aria-hidden="true"></i></a></td>
                    <?php } ?>
                  </tr>
                <?php
                }
                ?>
                </tbody>
            </table>
          </div>
        </div>
      </div>

<hr></hr>
     
    </div>
  </div>
</div>
<script type="text/javascript">
    $('#btn-filter').on('click', function() {
    url = 'index.php?route=pd/pd&token=<?php echo $token; ?>';
    var filter_status = $('select[name=\'filter_status\']').val();
  
  if (filter_status != '*') {
    url += '&filter_status=' + encodeURIComponent(filter_status); 
  } 
  location = url;
  });
    $('#exportpd').on('click', function() {
    url = 'index.php?route=report/exportCustomer/exportpd&token=<?php echo $token; ?>';
    location = url;
  });
</script>
<script type="text/javascript">
$(function() { $('#confirm').removeClass('disabled');
     //$('#confirm').hide();
    $('#Statistical').on('click', function() {
        $.ajax({
             url: $('#Statistical').data('link'),
            type : 'GET',
          
            success : function(result) {
               result = $.parseJSON(result);
                 $('#list').html('');
                $('#list').append(result.html);
               $('#confirm').removeClass('disabled');
               $('#confirm').show('slow');
               $('#Statistical').addClass('disabled');
            }
        });
        return false;
    });
});
</script>
<script type="text/javascript">
$(function() {
    $('#confirm').on('click', function() {
alert('11111');
        $.ajax({
             url: $('#confirm').data('link'),
            type : 'GET',
          
            success : function(result) {
               result = $.parseJSON(result);
                $('#confirm').addClass('disabled'); 
            }
        });
        return false;
    });
});
</script>
<?php echo $footer; ?>
<style type="text/css">
  .tab-content{
    width: 93%;
  }
</style>