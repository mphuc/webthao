<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>Transaction</h1>

  </div>
</div>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title pull-left">Transaction </h3>
      
      <div class="clearfix">
          
      </div>
    </div>
    <div class="panel-body row">
        <div class="clearfix" style="margin-top:10px;"></div>
     	<table class="table table-bordered table-hover">
     		<thead>
     			<tr>
     				<th>TT</th>
     				<th>Username mua</th>
     				<th>Username bán</th>
            <th>Amount BTC</th>
            <th>Price</th>
            <th>Amount VNĐ</th>
            <th>Date added</th>
            <th>Date finish</th>
            <th>Trạng thái mua</th>
            <th>Trạng thái bán</th>
     			</tr>
     		</thead>
     		<tbody>
        <?php 
          $i = 0;
          //print_r($_SESSION); die;
          foreach ($code as $value) {
            $i++;
            
        ?>
          <tr <?php if ($value['status_tranfer'] == 1) echo 'style="background: #f5acb3;"' ?> >
            <td><?php echo $i; ?></td>
            <td><?php echo $seft->getCustomer_buyid($value['gd_id_customer'])['username']; ?></td>
            <td><?php echo $seft->getCustomer_buyid($value['pd_id_customer'])['username']; ?></td>
            <td><?php echo $value['numbtc']/100000000 ?></td>
            
            <td><?php echo number_format($value['price']); ?></td>
            <td><?php echo number_format($value['amount']); ?></td>
            <td><?php echo date('d/m/Y H:i',strtotime($value['date_added'])); ?></td>
            <td><?php echo date('d/m/Y H:i',strtotime($value['date_finish'])); ?></td>
            <td class="text-center">
              <?php
                switch ($value['gd_status']) {
                    case 0:
                        echo '<span class="label label-default">Waitting</span>';
                        break;
                    case 1:
                        echo '<span class="label label-success">Finish</span>';
                        
                        break;
                    case 2:
                        echo '<span class="label label-danger">Time over</span>';
                        break;
                    case 3:
                        echo '<span class="label label-danger">Report</span>';
                        break;
                }
                ?> 
              </td>
              <td class="text-center">
              <?php
                switch ($value['pd_status']) {
                    case 0:
                        echo '<span class="label label-default">Waitting</span>';
                        break;
                    case 1:
                        echo '<span class="label label-success">Finish</span>';
                        
                        break;
                    case 2:
                        echo '<span class="label label-danger">Time over</span>';
                        break;
                    case 3:
                        echo '<span class="label label-danger">Report</span>';
                        break;
                }
                ?> 
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
</style>