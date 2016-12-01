<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="main-content">
   <div class="page-header">
      <div class="header-left-panel">
          <!--  Title Page -->
          <h1 class="page-title">Password for login</h1>
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
                     <form id="frmChangePassword" action="<?php echo $self -> url -> link('account/setting/editpasswd', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
                        <div class="form-group">
                           <label class="col-md-3 control-label"><?php echo $lang['text_old_password'] ?>:</label>
                           <div class="col-md-6">
                              <div class="input-group">
                        
                                 <input class="form-control" id="OldPassword" type="password" data-link="<?php echo $self -> url -> link('account/setting/checkpasswd', '', 'SSL'); ?>" />
                                 <div class="clearfix"></div>
                                 <span id="OldPassword-error" class="field-validation-error">
                                 <span></span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-md-3 control-label"><?php echo $lang['text_new_password'] ?>:</label>
                           <div class="col-md-6">
                              <div class="input-group">
         
                                 <input class="form-control" id="Password" name="password" type="password"/>
                                 <span id="Password-error" class="field-validation-error">
                                 <span></span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-md-3 control-label"><?php echo $lang['text_confirm_password'] ?>:</label>
                           <div class="col-md-6">
                              <div class="input-group">

                                 <input class="form-control" id="ConfirmPassword"  type="password"/>
                                 <span id="ConfirmPassword-error" class="field-validation-error">
                                 <span></span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-md-3 control-label"></label>
                           <div class="col-md-6">
                              <button type="submit" class="btn btn-primary password-submit"><?php echo $lang['text_button_password'] ?></button>
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