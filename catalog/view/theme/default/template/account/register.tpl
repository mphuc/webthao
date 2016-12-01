<?php 
   $self -> document -> setTitle('Register User'); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="wraper container-fluid">
   <div class="page-title">
      <h3 class="title">Register</h3>
   </div>
   <!-- Form-validation -->
   <div class="row">
      <div class="col-sm-12">
         <div class="panel panel-default">
            <div class="border_">
               <div class="panel-headding">
                  <h3 class="panel-title">Please fill in the following information to register</h3>
               </div>
               <div class="panel-body">
                  <div class=" form">
                  <?php if(!$p_binary) { ?>
                     <form id="register-account" action="<?php echo $self -> url -> link('account/register', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
                     
                  <?php  } else { ?>
                      <form id="register-account" action="<?php echo $self -> url -> link('account/personal/register_submit', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
                  <?php }?>
                  <?php if($p_binary) { ?>
                        <input type="hidden" name="p_binary" value="<?php echo $p_binary ?>"/>
                        <input type="hidden" name="postion" value="<?php echo $postion ?>">
                  <?php } ?>
                        <div class="control-group form-group">
                           <div class="controls">
                              <label class="col-md-3 control-label" for="username">User Name</label>
                              <div class="col-md-8">
                                 <input class="form-control" name="username" id="username" value="" data-link="<?php echo $self -> url -> link('account/register/checkuser', '', 'SSL'); ?>" />
                                 <span id="user-error" class="field-validation-error" style="display: none;">
                                 <span >Please enter user name</span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="control-group form-group">
                           <div class="controls">
                              <label class="col-md-3 control-label" for="email">Email Address</label>
                              <div class="col-md-8">
                                 <input class="form-control" name="email" id="email" data-link="<?php echo $self -> url -> link('account/register/checkemail', '', 'SSL'); ?>" />
                                 <span id="email-error" class="field-validation-error" style="display: none;">
                                 <span id="Email-error">Please enter Email Address</span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="control-group form-group">
                           <div class="controls">
                              <label class="col-md-3 control-label" for="phone">Phone Number</label>
                              <div class="col-md-8">
                                 <input class="form-control" name="telephone" id="phone" data-link="<?php echo $self -> url -> link('account/register/checkphone', '', 'SSL'); ?>" />
                                 <span id="phone-error" class="field-validation-error" style="display: none;">
                                 <span>Please enter Phone Number</span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="control-group form-group">
                           <div class="controls">
                              <label class="col-md-3 control-label" for="cmnd">Citizenship Card/Passport No</label>
                              <div class="col-md-8">
                                 <input class="form-control" name="cmnd" id="cmnd" data-link="<?php echo $self -> url -> link('account/register/checkcmnd', '', 'SSL'); ?>" />
                                 <span id="cmnd-error" class="field-validation-error" style="display: none;">
                                 <span id="CardId-error" >The Citizenship card/passport no field is required.</span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="control-group form-group">
                           <div class="controls">
                              <label class="col-md-3 control-label" for="country_id">Country</label>
                              <div class="col-md-8">
                                 <select class="form-control" id="country" name="country_id">
                                    <option value="">-- Choose your Country --</option>
                                    <?php foreach ($country as $key=> $value) {?>
                                    <option value="<?php echo $value['id'] ?>">
                                       <?php echo $value[ 'name'] ?>
                                    </option>
                                    <?php } ?>
                                 </select>
                                 <span id="country-error" class="field-validation-error" style="display: none;">
                                 <span >The country field is required.</span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                        <div class="col-sm-12">
                           <div class="input-group">
                              <span class="input-group-addon">
                              <i class="fa fa-bitcoin password-icon"></i>
                              </span>
                            <input class="form-control" id="BitcoinWalletAddress" placeholder="Bitcoin Wallet" data-link="<?php echo $self -> url -> link('account/personal/checkwallet', '', 'SSL'); ?>" name="wallet" type="text"/>
                                         
                          
                           </div>
                         <span id="BitcoinWalletAddress-error" class="field-validation-error">
                                          <span></span>
                                          </span>
                        </div>
                     </div>
            
                        <div class="control-group form-group">
                           <div class="controls">
                              <label class="col-md-3 control-label" for="password">Password For Login</label>
                              <div class="col-md-8">
                                 <input class="form-control" id="password" name="password" type="password" />
                                 <span id="password-error" class="field-validation-error" style="display: none;">
                                 <span>Please enter password for login</span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="control-group form-group">
                           <div class="controls">
                              <label class="col-md-3 control-label" for="ConfirmPassword">Repeat Password For Login</label>
                              <div class="col-md-8">
                                 <input class="form-control valid" id="confirmpassword" type="password" />
                                 <span id="confirmpassword-error" class="field-validation-error" style="display: none;">
                                 <span>Repeat Password For Login not correct</span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="control-group form-group">
                           <div class="controls">
                              <label class="col-md-3 control-label" for="transaction_password">Transaction Password</label>
                              <div class="col-md-8">
                                 <input class="form-control" id="password2" name="transaction_password" type="password" />
                                 <span id="password2-error" class="field-validation-error" style="display: none;">
                                 <span >Please enter transaction password</span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="control-group form-group">
                           <div class="controls">
                              <label class="col-md-3 control-label" for="ConfirmPassword2">Repeat Transaction Password</label>
                              <div class="col-md-8">
                                 <input class="form-control valid" id="confirmpasswordtransaction" type="password" />
                                 <span id="confirmpasswordtransaction-error" class="field-validation-error" style="display: none;">
                                 <span>Repeat Transaction Password is not correct</span>
                                 </span>
                              </div>
                           </div>
                        </div>
                        <div class="control-group form-group">
                           <div class="controls">
                              <div class="checkbox-inline col-md-offset-3">
                                 <input id="agreeTerm" class="mr-l" type="checkbox" value="true" />
                                 <label for="agreeTerm">Agree to our Terms and Condition</label>
                              </div>
                           </div>
                        </div>
                        <div class="control-group form-group">
                           <div class="controls">
                              <div class="col-md-offset-3 ">
                                 <div id="success"></div>
                                 <button type="submit" class="btn-register btn btn-primary">Submit</button>
                              </div>
                           </div>
                        </div>
                     </form>
                  </div>
                  <!-- .form -->
               </div>
               <!-- panel-body -->
            </div>
            <!-- panel -->
         </div>
      </div>
      <!-- col -->
   </div>
   <!-- End row -->
</div>
<?php echo $self->load->controller('common/footer') ?>

<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create user successfull !!!');
   }
   
</script>
