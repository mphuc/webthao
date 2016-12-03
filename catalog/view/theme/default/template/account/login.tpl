<!DOCTYPE html>
<html lang="en">
   
<!-- Mirrored from florathemes.com/html/porish/porish-left-menu/light/features/login_v3.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 30 Nov 2016 18:18:36 GMT -->
<head>
      <meta charset="utf-8">
      <meta name="description" content="bootstrap material admin template">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <title>Login | Website</title>
      <!-- Favicons -->
      <link rel="icon" href="catalog/view/theme/default/img/logo.png">
      <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300%7CRaleway:400,300%7CRoboto:400,700,300%7CLato' rel='stylesheet' type='text/css' />
      <!-- Icon CSS -->
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/iconstyle.css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/fonts/material-design/material-design.min.css" />
      <!-- Global plugin CSS -->
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/bootstrap.min.css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/switchery/switchery.min.css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/waves.min.css" />
      <!--  Global Template CSS -->
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/style.css" />
                <link id="site-color" rel="stylesheet" href="catalog/view/theme/default/assets/css/colors/cyan.css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/site.min.css" />
      <!-- Page CSS -->
      <link href="catalog/view/theme/default/assets/css/login-page/form.css" rel="stylesheet" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/validation/validation.css" type="text/css" />
      <script src="catalog/view/javascript/alertifyjs/alertify.js" type="text/javascript"></script>
      <link href="catalog/view/theme/default/css/al_css/alertify.css" rel="stylesheet">
   </head>
   <body class="login-form login-form-3">
      <div class="main-login-form">
         <div class="content-login">
            <div class="logo-title logo-login2">
               <!-- Template Logo -->
               <span><img style="width: 250px;" alt="logo" src="catalog/view/theme/default/img/logo.png"></span>
            </div>
            <div class="login-page login-second-page">
               <!-- Start Login Form -->
               
               <form action="login.html" method="post" class="form-login">
                   <div class="input-box input-box-login2">
                     <div class="left-icon-login btn-info"><i class="icon icon_profile"></i></div>
                     <div class="textbox-login">
                        <input  autocomplete="off" type="text" name="email" value="<?php echo $email; ?>" placeholder="Username" id="input-email" class="form-control" />
                     </div>
                  </div>
                  <div class="input-box input-box-login2">
                     <div class="left-icon-login btn-info"><i class="icon icon_lock"></i></div>
                     <div class="textbox-login">
                        <input autocomplete="off" type="password" name="password" value="<?php echo $password; ?>" placeholder="Password" id="input-password" class="form-control" />
                     </div>
                  </div>
                  <?php
                     $ranStr = md5(microtime());
                     $ranStr = hexdec( crc32($ranStr));
                     $ranStr = substr($ranStr, 0, 6);
                     $_SESSION['cap_code'] = $ranStr;
                   ?>
                  <div class="input-box input-box-login2">
                     <div class="left-icon-login btn-info"><i class="icon icon_mail"></i></div>
                     <div class="textbox-login">
                        <img class="img_capcha" style="float: left; height: 40px;" src="captcha_code.php"/>
                        <input style="width: 65%; margin-left: px; float: right" autocomplete="off" type="text" name="capcha" placeholder="Capcha" id="input-password" value="" class="form-control" />
                     </div>
                  </div>
                  <div class="bottom-login">
                     <div class="remember-text-login remember-register-3">
                        <span class="checkbox-custom checkbox-primary">
                        <input id="requiredCheckbox" class="all-selectable" type="checkbox">
                        <label for="requiredCheckbox">Remember me</label>
                        </span>
                     </div>
                     <div class="remember-text-login forget-password-login remember-register-3"><a href="forgot.html"  class="forgot">Forgot Password?</a></div>
                  </div>
                  <div class="form-group">
                     <button class="btn btn-info btn-sign waves-effect waves-dark" type="submit">Sign In</button>
                  </div>
                  <?php if ($redirect) { ?>
                     <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                     <?php } ?>
                  
                  <?php if ($success) { ?>
                  <div class="text-success"><i class="fa fa-check-circle"></i>
                     <?php echo $success; ?>
                  </div>
                  <?php } ?>
                  <?php if ($error_warning) { ?>
                  <div class="text-warning"><i class="fa fa-exclamation-circle"></i>
                     <?php echo $error_warning; ?>
                  </div>
                  <?php } ?>
               
         </form>
            </div>
         </div>
      </div>
      <!-- Global Plugin JavaScript -->
      
   </body>

<!-- Mirrored from florathemes.com/html/porish/porish-left-menu/light/features/login_v3.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 30 Nov 2016 18:18:36 GMT -->

<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Activation successful!');
      //alertify.success('Dear all members. <br/> Our Server is temporary stopped for upgarade, we will resume at 03:00 AM EDT <br/>Thank you for your cooperation!');
   }
   jQuery(document).ready(function($) {
      jQuery('.cap_code_new').click(function(){
         jQuery('.img_capcha').attr({'src':'<?php echo HTTPS_SERVER;?>captcha_code.php'});

      });
   });
</script>