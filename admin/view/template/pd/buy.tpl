<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>Buy</h1>

  </div>
</div>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title pull-left">Buy </h3>
      
      <div class="clearfix">
          
      </div>
    </div>
    <div class="panel-body row">
        <div class="clearfix" style="margin-top:10px;"></div>
     	<table class="table table-bordered table-hover">
     		<thead>
     			<tr>
     				<th>TT</th>
            
     				<th>Username</th>
     				
            <th>Amount BTC</th>
            <th>Price</th>
            <th>Amount VNĐ</th>
            <th>Date added</th>
            <th>Trạng thái</th>
     			</tr>
     		</thead>
     		<tbody>
        <?php 
          $i = 0;
          //print_r($_SESSION); die;
          foreach ($code as $value) {
            $i++;
            
        ?>
          <tr>
            <td><?php echo $i; ?></td>
           
            <td><?php echo $value['username']; ?></td>
             <td><?php echo $value['filled']/100000000 ?></td>
            
            <td><?php echo number_format($value['price']); ?></td>
           <td><?php echo number_format($value['amount']); ?></td>
            <td><?php echo date('d/m/Y H:i',strtotime($value['date_added'])); ?></td>
            
            <td class="text-center">
              <?php
                switch ($value['status']) {
                    case 0:
                        echo '<span class="label label-default">Waitting</span>';
                        break;
                    case 1:
                        echo '<span class="label label-danger">Matched</span>';
                        break;
                    case 2:
                        echo '<span class="label label-success">Finish</span>';
                        break;
                    case 3:
                        echo '<span class="label label-danger">Report</span>';
                        break;
                }
                ?> 
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