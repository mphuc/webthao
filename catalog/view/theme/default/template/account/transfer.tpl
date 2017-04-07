<?php 
   $self -> document -> setTitle('Mining'); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="main-content">
    <div class="page-header">
      <div class="header-left-panel">
          <!--  Title Page -->
          <h1 class="page-title">Transaction</h1>
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
                        <div class="nav-tabs-horyzontal nav-tabs-inverse border-top" style="margin-top: 40px;">
                           <ul class="nav  nav-tabs nav-top-line hover-none" role="tablist">
                              <li class="nav-item active">
                                 <a class="nav-link " data-toggle="tab" href="#home11" role="tab" aria-expanded="true">Withdraw BTC</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link " data-toggle="tab" href="#profile11" role="tab" aria-expanded="false">Buy Token</a>
                              </li>
                              
                           </ul>
                           <div class="tab-content ">
                              <div class="tab-pane active" id="home11" role="tabpanel">
                                <div class="col-md-4 col-md-push-2 text-center">
                                  <div class="item_wallet">
                                      <h5>Your Sfccoin</h5>
                                      <div class="box box-block bg-white tile tile-1 mb-2">
                                          <img src="catalog/view/theme/default/images/sfccoin.png" style="height: 50px;margin-top: 10px;" alt="">
                                          <div class="t-content">
                                              
                                              <h1 class="mb-1" style="margin-top: 10px;"><?php echo number_format($customer['coin']) ?> Sfccoin<p></p></h1>
                                          </div>
                                      </div>
                                  </div>
                               </div>     
                               <div class="col-md-4 col-md-push-2 text-center">
                                  <div class="item_wallet">
                                      <h5>Your Balance Wallet</h5>
                                      <div class="wallet wallet_blockcio">
                                          <img src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=<?php echo $customer['wallet'] ?>" alt="">
                                      </div>
                                      <p><?php echo $customer['wallet'] ?></p>
                                      <!-- <p>Amount: <?php //echo doubleval(round($amount_blockchain,8)); ?> BTC</p> -->
                                      <!-- <p>Amount Pending: <?php //echo doubleval(round($amount_blockchain_pending,8)); ?> BTC</p> -->
                                  </div>
                               </div>   
                               <div class="clearfix"></div> 
                              <form id="tranfer_cm_btc" style="margin-top: 30px;" action="index.php?route=account/transfer/submit_my_transaction" method="POST" >
                                <div class="col-md-2 col-md-push-1 wow fadeInUp" data-wow-delay="0.3s">
                                  <input autocomplete="off" class="form-control" placeholder="Amount Sfccoin" type="text" name="amount_sfccoin" id="amount_sfccoin">
                                   <p class="error error_amount_sfccoin">Please enter a amount sfccoin</p>
                                 
                                </div>
                                <div class="col-md-2 col-md-push-1 wow fadeInUp" data-wow-delay="0.3s">
                                  <input autocomplete="off" data-link="<?php echo $self->url->link('account/withdraw/get_btc_sfccoin'); ?>" class="form-control" readonly="true" placeholder="Amount BTC" type="text" name="amount_btc" id="amount_btc">
                                </div>
                                <div class="col-md-3 col-md-push-1  wow fadeInUp" data-wow-delay="0.3s">
                                  <input autocomplete="off" class="form-control" placeholder="Password Transaction" type="password" name="password_transaction_btc" id="password_transaction_btc">
                                   <p class="error error_password_transaction_btc">Please enter a password transaction</p>
                                  <p class="error error_password_transaction_deal_btc">Password do not macth</p>
                                </div>
                                <div class="col-md-2 col-md-push-1  wow fadeInUp" data-wow-delay="0.3s">
                                 <input class="form-control btn btn-primary" style="    background-color: #337ab7 !important;"  id="" type="submit" value="OK">
                                </div>
                                 
                               </form>
                                <div class="clearfix"></div>
                                <br><br>
                                <p>1 Sfc coin = 0.0008 BTC</p>
                                <h3 class="text-center">History Withdraw</h3>
                                <table id="datatable" class="table table-striped table-bordered">
                                  <thead>
                                    <tr>
                                      <th>No.</th>
                                      <th>Sfcoin withdraw</th>
                                      <th>BTC withdraw</th>
                                      <th>Date withdraw</th>
                                      <th>Link Transfer</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <?php if (count($history_coin_wallet_payment) > 0) { ?>
                                  <?php $i=0; foreach ($history_coin_wallet_payment as $value) { $i++;?>
                                    <tr>
                                      <td><?php echo $i ?></td>
                                      <td><?php echo number_format($value['coin']) ?> Sfcoin</td>
                                      <td><?php echo ($value['amount']/100000000) ?> BTC</td>
                                      <td><?php echo date('d/m/Y H:i',strtotime($value['date_added'])) ?></td>
                                      <td>
                                        <?php if ($value['status'] == 0) echo "Pending" ?>
                                      </td>
                                    </tr>
                                  <?php } ?>
                                  <?php } else { ?>
                                    <tr>
                                      <td colspan="5">No data available in table</td>
                                    </tr>
                                  <?php } ?>
                            </tbody>
                        </table>
                              </div>
                              <div class="tab-pane" id="profile11" role="tabpanel">
                                 <div class="col-md-4 col-md-push-2 text-center">
                                  <div class="item_wallet">
                                      <h5>Your Reinvestment</h5>
                                      <div class="box box-block bg-white tile tile-1 mb-2">
                                          <img src="catalog/view/theme/default/images/logo.png" style="height: 50px;margin-top: 10px;" alt="">
                                          <div class="t-content">
                                              
                                              <h1 class="mb-1" style="margin-top: 10px;"><?php echo $get_M_Wallet/100000000 ?> BTC<p></p></h1>
                                          </div>
                                      </div>
                                  </div>
                               </div>     
                               <div class="col-md-4 col-md-push-2 text-center">
                                  <div class="item_wallet">
                                      <h5>Your Token</h5>
                                      <div class="box box-block bg-white tile tile-1 mb-2">
                                          <img src="catalog/view/theme/default/images/logo.png" style="height: 50px;margin-top: 10px;" alt="">
                                          <div class="t-content">
                                              
                                              <h1 class="mb-1" style="margin-top: 10px;"><?php echo number_format($wallet_token) ?> Token<p></p></h1>
                                          </div>
                                      </div>
                                  </div>
                               </div>   
                               <div class="clearfix"></div> 
                              <form id="tranfer_cm_btc_token" style="margin-top: 30px;" action="index.php?route=account/withdraw/submit_my_transaction" method="POST" >
                                <div class="col-md-2 col-md-push-1 wow fadeInUp" data-wow-delay="0.3s">
                                  <input autocomplete="off" class="form-control" placeholder="Amount Token" type="text" name="amount_sfccoin" id="amount_token">
                                   <p class="error error_amount_sfccoin">Please enter a amount sfccoin</p>
                                 
                                </div>
                                <div class="col-md-2 col-md-push-1 wow fadeInUp" data-wow-delay="0.3s">
                                  <input autocomplete="off" data-link="<?php echo $self->url->link('account/withdraw/get_btc_sfccoin'); ?>" class="form-control" readonly="true" placeholder="Amount BTC" type="text" name="amount_btc" id="amount_btc_token">
                                </div>
                                <div class="col-md-3 col-md-push-1  wow fadeInUp" data-wow-delay="0.3s">
                                  <input readonly="true" autocomplete="off" class="form-control" placeholder="Password Transaction" type="password" name="password_transaction_btc" id="password_transaction_btc">
                                   <p class="error error_password_transaction_btc">Please enter a Secret answer</p>
                                  <p class="error error_password_transaction_deal_btc">Password do not macth</p>
                                </div>
                                <div class="col-md-2 col-md-push-1  wow fadeInUp" data-wow-delay="0.3s">
                                 <input class="form-control btn btn-primary" style="    background-color: #337ab7 !important;"  id="" type="submit" value="OK">
                                </div>
                                 
                               </form>
                                <div class="clearfix"></div>
                                <br><br>
                                <p>1 Token = 0.000025 BTC</p>
                                <h3 class="text-center">History Buy token</h3>
                                <table id="datatable" class="table table-striped table-bordered">
                                  <thead>
                                    <tr>
                                      <th>No.</th>
                                      <th>Amount token</th>
                                      <th>BTC buy</th>
                                      <th>Date withdraw</th>
                                      
                                    </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td colspan="5">No data available in table</td>
                                  </tr>
                            </tbody>
                        </table>
                                 <br>
                                 
                              </div>
                              
                           </div>
                        </div>
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