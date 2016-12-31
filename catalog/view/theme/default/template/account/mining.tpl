<?php 
   $self -> document -> setTitle('Mining'); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="main-content">
    <div class="page-header">
      <div class="header-left-panel">
          <!--  Title Page -->
          <h1 class="page-title">Mining</h1>
          <!--  Breadcrumb Section -->
      </div>
    </div>
    <div class="page-content container-fluid">
        <div class="main-dashboard">
   <div class="row rule" style="margin-top:0;">
        <div class="col-md-12" id="anouncenment">
            <div class="panel panel-default">
                <div class="panel-heading">
                    
                </div>
              
                <div class="panel-body mining" style="min-height:335px;">
                    <div class="row">
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <h3 class="title_left">YOUR POOLS</h3>
                          <table id="datatable" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                   
                                          <th>No.</th>
                                          <th>Token Mining</th>
                                          <th>Coins Found</th>
                                          <th>Date Mining</th>
                                          <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (count($histotys) > 0) {?>
                                 <?php $number = 1; foreach ($histotys as $key => $value) {?>
                                      <tr>
                                           <td data-title="No." align="center"><?php echo $number ?></td>
                                          <td data-title="Token Mining"><?php echo number_format($value['amount_mining']) ?> Token</td>
                                          <td data-title="Coins Found"><?php echo number_format($value['coin_mining']) ?> SFC Coin</td>
                                          <td data-title="Date Mining"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                                          <td data-title="Status">
                                              <?php if ($value['status'] == 0) { ?>
                                                <span class="label label-warning">Warning</span>
                                              <?php } else { ?>
                                                <span class="label label-success">Success</span>
                                              <?php } ?>
                                          </td>
                                      </tr>
                                  <?php $number++; } ?>
                                  <?php } else { ?>
                                    <tr>
                                      <td colspan="5">No data available in table</td>
                                    </tr>
                                  <?php } ?>
                            </tbody>
                        </table>
                        <?php echo $pagination; ?>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                          <div class="title_right">
                            <h3>TOKENS FOR MINING</h3>
                          </div>
                          <div class="content_right">
                            <p>Tokens Available </p>
                            <p>For Mining:</p>
                            <p><b><?php echo number_format($get_token_mining) ?> Token</b></p>
                          </div>
                          <hr>
                          <?php if ($get_token_mining > 0) { ?>
                          <form id="mining" action="?route=account/mining/submit" method="POST">
                          <?php } ?>
                            <input style="width: 60%; float: left; margin-right: 10px;" class="form-control" type="text" placeholder="Tokens to submit" name="amount" id="amount">
                            <input type="hidden" id="balance" value="<?php echo $get_token_mining ?>">
                            <?php if ($get_token_mining == 0) { ?>
                             <button class="btn btn-primary" style="opacity: 0.4">Submit</button>
                            <?php } else { ?>
                            <input style="width: 30%;float: left;" class="btn btn-primary" type="submit" name="" value="Submit">
                            <?php } ?>
                          </form>
                        </div>
                        <br>
                        <div class="clearfix" style="margin-top: 20px;"></div>
                        <p>Difficulty: 25 Token / Coin</p>
                        <p>Time to dig out coin was between 30 to 45 days</p>
                    </div>
                </div>
              
            </div>
        </div>
    </div> 
  </div>
</div>
</div>
   <!-- End Row -->
   <!-- End row -->
</div>
<?php echo $self->load->controller('common/footer') ?>