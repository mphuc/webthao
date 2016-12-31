<?php
$self -> document -> setTitle('Register User');
 echo $header; ?>
 <style type="text/css" media="screen">
    .main-header{
      display: none;
    }
 </style>
 
<div class="login-form page-login-image">
   <div class="main-login-form register-page">
         <div class="content-login">
            <div class="login-page">
               <div class="logo-title">
                  <!-- Template Logo -->
                  <img src="catalog/view/theme/default/img/logo.png" alt="logo" style=" width:150px;">
               </div>
               <p class="sign-login">Create an Account.</p>
               <!-- Start Register Form -->
               <form id="register-account" action="<?php echo $self -> url -> link('account/registers/confirmSubmit', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
       
         
            <div class="input-box">
               <div class="left-icon-login btn-info"><i class="icon icon_profile"></i></div>
               <div class="textbox-login">
                  <input type="hidden" name="node" value="<?php echo $self->request->get['ref']; ?>">
                  <input class="form-control" placeholder="Your Username" name="username" id="username" value="" data-link="<?php echo $actionCheckUser; ?>">
                  <span id="user-error" class="field-validation-error" style="display: none;">
                     <span>Please enter user name</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               <div class="left-icon-login btn-info"><i class="fa fa-envelope" aria-hidden="true"></i></div>
               <div class="textbox-login">
                 
                  <input class="form-control" placeholder="Email Address" name="email" id="email" data-link="<?php echo $actionCheckEmail; ?>">
                  <span id="email-error" class="field-validation-error" style="display: none;">
                     <span id="Email-error">Please enter Email Address</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               <div class="left-icon-login btn-info"><i class="fa fa-phone-square" aria-hidden="true"></i></div>
               <div class="textbox-login">
                  <input class="form-control" placeholder="Phone Number" name="telephone" id="phone" data-link="<?php echo $actionCheckPhone; ?>">
                  <span id="phone-error" class="field-validation-error" style="display: none;">
                     <span>Please enter Phone Number</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               <div class="left-icon-login btn-info"><i class="fa fa-file-image-o" aria-hidden="true"></i></div>
               <div class="textbox-login">
                  <input class="form-control" placeholder="Citizenship Card/Passport No" name="cmnd" id="cmnd" data-link="<?php echo $actionCheckCmnd; ?>">
                  <span id="cmnd-error" class="field-validation-error" style="display: none;">
                     <span id="CardId-error">The Citizenship card/passport no field is required.</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               <div class="left-icon-login btn-info"><i class="fa fa-clone" aria-hidden="true"></i></div>
               <div class="textbox-login">
                  <select class="form-control" id="country" name="country_id">
                     <option value="">-- Choose your Country --</option>
                     <?php foreach ($country as $key=> $value) {?>
                     <option value="<?php echo $value['id'] ?>">
                        <?php echo $value[ 'name'] ?>
                     </option>
                     <?php } ?>
                  </select>
                  <span id="country-error" class="field-validation-error" style="display: none;">
                     <span>The country field is required.</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               <div class="left-icon-login btn-info"><i class="fa fa-key" aria-hidden="true"></i></div>
               <div class="textbox-login">
                  <input class="form-control" placeholder="Password For Login" id="password" name="password" type="password">
                  <span id="password-error" class="field-validation-error" style="display: none;">
                     <span>Please enter password for login</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               <div class="left-icon-login btn-info"><i class="fa fa-key" aria-hidden="true"></i></div>
               <div class="textbox-login">
                  <input class="form-control valid" placeholder="Repeat Password For Login" id="confirmpassword" type="password">
                  <span id="confirmpassword-error" class="field-validation-error" style="display: none;">
                     <span>Repeat Password For Login not correct</span>
                  </span>
               </div>
            </div>
   
            <div class="input-box">
               <div class="left-icon-login btn-info"><i class="icon icon_profile"></i></div>
               <div class="textbox-login">
                  <input class="form-control" id="password2" placeholder="Transaction Password" name="transaction_password" type="password">
                  <span id="password2-error" class="field-validation-error" style="display: none;">
                     <span>Please enter transaction password</span>
                  </span>
               </div>
            </div>

            <div class="input-box">
               <div class="left-icon-login btn-info"><i class="fa fa-key" aria-hidden="true"></i></div>
               <div class="textbox-login">
                  <input class="form-control valid" placeholder="Repeat Transaction Password" id="confirmpasswordtransaction" type="password">
                  <span id="confirmpasswordtransaction-error" class="field-validation-error" style="display: none;">
                     <span>Repeat Transaction Password is not correct</span>
                  </span>
               </div>
            </div>
              
            <div class="input-box">
               <div class="left-icon-login btn-info"><i class="fa fa-btc" aria-hidden="true"></i></div>
               <div class="textbox-login">
                  <input class="form-control" id="BitcoinWalletAddress" placeholder="Bitcoin Wallet" data-link="<?php echo $actionWallet; ?>" name="wallet" type="text"/>
                  <span id="BitcoinWalletAddress-error" style="display: none;" class="field-validation-error">
                     <span></span>
                  </span>
               </div>
            </div>               
            <div class="bottom-login">
               <div class="remember-text-login">
                  <span class="checkbox-custom checkbox-primary">
                  <input id="agreeTerm" type="checkbox" value="true">
                  <label for="requiredCheckbox">I agree to the <a href="javascript:void(0)">Terms and Conditions</a> and <a href="javascript:void(0)">Privacy Policy. </a></label>
                  </span>
               </div>
            </div>
            <div class="bottom-login">
              <button style="margin: 0 auto" type="submit" class="btn btn-info mobile-btn-login btn-sign waves-effect waves-dark">Register</button>
            </div>
            
                  <div class="text-center"><p>Copyrights © 2016 All Rights Reserved by Sfccoin.com</p></div>
            </div>
                  
        
      </form>
               
               <!-- End Register Form -->
              
            </div>
         </div>
      </div>
</div>

<style type="text/css">
   footer, .header-logo{display: none !important;}
   .container{padding-top: 10px;}
</style>
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create user successfull !!!');
   }
   
</script>
<?php echo $footer; ?>