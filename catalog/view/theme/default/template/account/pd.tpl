<?php $self -> document -> setTitle("Invesment Detail"); echo $self -> load -> controller('common/header'); echo $self -> load -> controller('common/column_left'); ?>

<div class="main-content">
    <div class="page-header">
      <div class="header-left-panel">
          <!--  Title Page -->
          <h1 class="page-title">Investment</h1>
          <!--  Breadcrumb Section -->
      </div>
    </div>
    <div class="page-content container-fluid">
        <div class="main-dashboard">
            <div class="row">
      <div class="col-md-12">
      <?php if(count($pds) > 0){?> 
         <div class="panel panel-default">
            <div class="panel-body">
               <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12" id="no-more-tables">
                     <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                           <tr>
 							                <th>Code</th>
                              <th>Date Created</th>
                              <th>Packet</th>
                              <th>Profit</th>
                              <th>Time</th>
                           </tr>
                        </thead>
                        <tbody>
                           <?php foreach ($pds as $value=> $key){?> 
                           <tr>
        					<td data-title="Code">#<?php echo $key['pd_number'] ?></td>
                            <td data-title="Date Created"><?php echo date("Y-m-d H:i:A", strtotime($key['date_added'])); ?></td>
                              
                            <td data-title="Packet">
                              	<?php echo (doubleval($key['filled']) / 100000000) ?> BTC
                            </td>
                            <td data-title="Profit"> <?php echo (doubleval($key['max_profit']) / 100000000) ?> BTC</td>
                      
                            <td data-title="Time"> <span style="color:; font-size:15px;" class="text-warning countdown" data-countdown="<?php echo  $key['date_finish'] ?>"> </span> </td>
                           </tr>
                           <?php }?> 
                        </tbody>
                     </table>
                  </div>
               </div>
              
               
            </div>
         </div>
         <?php } ?>

         </div>
      </div>
   </div>
</div>
</div><?php echo $self->load->controller('common/footer') ?>