<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="main-content">
   <div class="page-header">
      <div class="header-left-panel">
         <!--  Title Page -->
         <h1 class="page-title">Password for transaction</h1>
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
                        <div class="col-md-12 col-sm-12 col-xs-12">
                           <form id="changePasswdTransaction" action="<?php echo $self -> url -> link('account/setting/edittransactionpasswd', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
                              <div class="form-group">
                                 <label class="col-sm-3 control-label"><?php echo $lang['text_old_password'] ?>:</label>
                                 <div class="col-sm-6">
                                    <div class="input-group">
                                       <span class="input-group-addon">
                                       <i class="fa fa-lock old-password-icon"></i></span>
                                       <input class="form-control" id="TranoldPassword" type="password" data-link="<?php echo $self -> url -> link('account/setting/checkpasswdtransaction', '', 'SSL'); ?>" />
                                       <div class="clearfix"></div>
                                       <span id="TranoldPassword-error" class="field-validation-error">
                                       <span></span>
                                       </span>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-3 control-label"><?php echo $lang['text_new_password'] ?>:</label>
                                 <div class="col-sm-6">
                                    <div class="input-group">
                                       <span class="input-group-addon">
                                       <i class="fa fa-lock new-password-icon"></i></span>
                                       <input class="form-control" id="Tranpassword_New" name="transaction_password" type="password"/>
                                       <span id="Tranpassword_New-error" class="field-validation-error">
                                       <span></span>
                                       </span>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-3 control-label"><?php echo $lang['text_confirm_password'] ?>:</label>
                                 <div class="col-sm-6">
                                    <div class="input-group">
                                       <span class="input-group-addon">
                                       <i class="fa fa-lock re-new-password-icon"></i></span>
                                       <input class="form-control" id="TranConfirmPassword" type="password"/>
                                       <span id="TranConfirmPassword-error" class="field-validation-error" style="display:none">
                                       <span></span>
                                       </span>
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-3 control-label"></label>
                                 <div class="col-sm-6">
                                    <button type="submit" class="btn btn-primary"><?php echo $lang['text_button_password'] ?></button>
                                    <a data-link="<?php echo $self -> url -> link('account/forgotten/resetPasswdTran', '', 'SSL'); ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>" id="reset_passwdTran" href="javascript:;" class="btn btn-danger"><?php echo $lang['text_button_transaction_password'] ?></a>
                                 </div>
                              </div>
                           </form>
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