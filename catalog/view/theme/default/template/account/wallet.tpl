<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="main-content">
   <div class="page-header">
      <div class="header-left-panel">
          <!--  Title Page -->
          <h1 class="page-title">Your Wallet</h1>
          <!--  Breadcrumb Section -->
      </div>
    </div>     
    <div class="page-content container-fluid">
        <div class="main-dashboard">
            <div class="row">
      <div class="col-md-12">
         <div class="panel panel-default">
            <div class="panel-body">
               <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12" id="EditProfile" data-link="<?php echo $self -> url -> link('account/setting/account', '', 'SSL'); ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>" >
                    <!--  <?php //if($customer['wallet']){ ?> -->
                     <div class="col-lg-6">
                        <form id="updateWallet" action="<?php echo $self -> url -> link('account/setting/updatewallet', '', 'SSL'); ?>" method="GET" novalidate="novalidate">
                           <div style="margin-bottom:20px">
                              <label for="BitcoinWalletAddress"><?php echo $lang['text_wallet_address'] ?></label>
                              <input class="form-control" id="BitcoinWalletAddress" name="wallet" type="text" data-link="<?php echo $self -> url -> link('account/account/main', '', 'SSL'); ?>" value="<?php echo $customer['wallet'] ?>"/>
                              <span id="BitcoinWalletAddress-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>
                           <div style="margin-bottom:20px">
                              <label for="transaction_password"><?php echo $lang['transaction_pasword'] ?></label>
                              <input placeholder="Transaction password" class="form-control" id="Password2" name="transaction_password" type="password"/>
                              <span id="Password2-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>

                           <div class="loading">
                           </div>
                           <button type="submit" class="btn btn-primary"><?php echo $lang['wallet_btn'] ?></button>
                        </form>
                        <!-- /.col-lg-6 (nested) -->
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
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Update profile successfull !!!');
   }
   
</script>
<?php echo $self->load->controller('common/footer') ?>