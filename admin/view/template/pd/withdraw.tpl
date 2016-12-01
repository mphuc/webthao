<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>Withdraw</h1>

  </div>
</div>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title pull-left">Withdraw </h3>
      
      <div class="clearfix">
          
      </div>
    </div>
    <div class="panel-body row">
        <div class="clearfix" style="margin-top:10px;"></div>
     	<table class="table table-bordered table-hover" style="width: 200%; overflow-y: scroll;">
        <thead>
          <tr>
            <th>TT</th>
            <th>Withdraw code</th>
            <th>Username bán</th>
            <th>Username mua</th>
            <th>Amount VNĐ</th>
            <th>Tên Ngân Hàng</th>
            <th>Tên Tài khoản</th>
            <th>Số tài khoản</th>
            <th>Chi Nhánh</th>
            <th>Thời gian tạo</th>
            <th>Thời gian kết thúc</th>
            <th>Trạng thái bán</th>
            <th>Trạng thái mua</th>
            <th>Images</th>

          </tr>
        </thead>
        <tbody>
        <?php 
          $i = 0;
          //print_r($_SESSION); die;
          foreach ($code as $value) {
            $i++;
        ?>
          <tr class="<?php echo ($value['user_withdraw']== 0) ? 'background' : ''  ?>">
            <td><?php echo $i; ?></td>
            <td><b>#<?php echo $value['withdraw_code']; ?></b></td>
            <td><?php echo $self->get_username_all($value['customer_id'])['username']; ?></td>
            <?php $username_sell = ($value['user_withdraw'] == 0) ? "ADMIN" : $self->get_username_all($value['user_withdraw'])['username'] ?>
            <td><?php echo $username_sell; ?></td>
            <td><?php echo number_format($value['amount']); ?></td>
            <td><?php echo $value['bank_name'] ?></td>
             <td><?php echo $value['account_holder']; ?></td>
            <td><?php echo $value['account_number']; ?></td>
            <td><?php echo $value['branch_bank']; ?></td>
            <td><?php echo date('d/m/Y H:i',strtotime($value['date_added'])); ?></td>
            <td class="text-center">
            <span style="color: red" class="countdown" data-countdown="<?php echo  $value['date_finish']?>">
              
            </span></td>
            <td data-title="You Status" class=""> 
               <?php
                  switch ($value['status_gd']) {
                      case 0:
                          echo '<span class="label label-default">Waitting</span>';
                          break;
                      case 1:
                          echo '<span class="label label-success">Finish</span>';
                          break;
                      case 2:
                          echo '<span class="label label-danger">Report</span>';
                          break;
                      case 3:
                          echo '<span class="label label-danger">Time over</span>';
                          break;
                  }
                  ?> 
            </td>
            <td data-title="Deposit Status" class=""> 
               <?php
                  if ($value['user_withdraw'] == 0)
                  {
                    if ($value['status_pd'] == 0) { ?>
                   
                    <a onclick="return confirm('Bạn có chắc chắn bạn đã chuyển tiền chưa?')" href="index.php?route=pd/withdraw/admin_finish&id=<?php echo $value['id'];?>&token=<?php echo $_GET['token'];?>"><span class="label label-danger">Waitting</span></a>
                     
                    <?php
                    } else  if ($value['user_withdraw'] == 0 && $value['status_pd'] == 1){ ?>
                        <span class="label label-success">finish</span>
                    <?php
                    } 
                  }
                 
                  else
                  {
                    switch ($value['status_pd']) {
                      case 0:
                          echo '<span class="label label-default">Waitting</span>';
                          break;
                      case 1:
                          echo '<span class="label label-success">Finish</span>';
                          break;
                       case 2:
                          echo '<span class="label label-danger">Report</span>';
                          break;
                      case 3:
                          echo '<span class="label label-danger">Time over</span>';
                          break;
                    }
                  }
                  
                  ?>
                  <br>
                 
                  
            </td>
            <td>
              <?php if ($value['status_pd'] == 1) { ?>
                <a target="_blank" href="<?php echo $value['image'] ?>">
                  <img src="<?php echo $value['image'] ?>" style="width: 100px;height: 100px;" alt="">
                </a>
              <?php } ?>
            </td>
            
              
          </tr>
         <?php
          }
         ?>
        </tbody>
      </table>
      <?php echo $pagination; ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>
<style type="text/css">
  i.red{
    color: #466E30;
  }
  i.blue{
    color: red;
  }
  tr.background,tr.background:hover{
    background: rgba(3, 155, 211, 0.25);
  }
</style>