<!DOCTYPE html>
<html lang="en">
  
<!-- Mirrored from florathemes.com/html/porish/porish-left-menu/light/features/forgot_password.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 30 Nov 2016 18:18:37 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="description" content="bootstrap material admin template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Forgot Password | Smart financial connections</title>
    <!-- Favicons -->
    
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300%7CRaleway:400,300%7CRoboto:400,700,300%7CLato' rel='stylesheet' type='text/css' />
    <!-- Icon CSS -->
    <link rel="icon" href="catalog/view/theme/default/img/logo_favi.png">
    <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/iconstyle.css" />
    <!-- Global plugin CSS -->
    <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/bootstrap.min.css" />
    <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/waves.min.css" />
    <!--  Global Template CSS -->
    <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/style.css" />
                <link id="site-color" rel="stylesheet" href="catalog/view/theme/default/assets/css/colors/cyan.css" />
    <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/site.min.css" />
    <!-- Page CSS -->
    <link href="catalog/view/theme/default/assets/css/forgot-page/forgot.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="catalog/view/theme/default/assets/css/validation/validation.css" type="text/css" />
    <!-- Start Alexa Certify Javascript -->
  <script type="text/javascript">
  _atrk_opts = { atrk_acct:"cBVho1IW1810N8", domain:"sfccoin.com",dynamic: true};
  (function() { var as = document.createElement('script'); as.type = 'text/javascript'; as.async = true; as.src = "https://d31qbv1cthcecs.cloudfront.net/atrk.js"; var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(as, s); })();
  </script>
  <noscript><img src="https://d5nxst8fruw4z.cloudfront.net/atrk.gif?account=cBVho1IW1810N8" style="display:none" height="1" width="1" alt="" /></noscript>
  <!-- End Alexa Certify Javascript -->  
  </head>
  <body class="page-forgot page-forgot-image">
    <div class="main-forgot-pass">
      <div class="content-forgot">
        <div class="forgot-page text-center">
          <h3 class="forgot-heading">Reset Password</h3>
          <p>Enter your Username to reset your password</p>
          <!-- Start Forgot password Form -->
          
          <form action="/forgot.html" method="post" class="forgot-form">
            <div class="input-box">
              <div class="left-icon-forgot"><i class="icon icon_mail"></i></div>
              <div class="textbox-forgot"><input type="text" name="email" value="" id="input-email" placeholder="Your Username" id="input-password" class="form-control" /></div>
            </div>
            <?php
              $ranStr = md5(microtime());
              $ranStr = hexdec( crc32($ranStr));
              $ranStr = substr($ranStr, 0, 6);
              $_SESSION['cap_code'] = $ranStr;
            ?>
            <div class="input-box">
              <div class="left-icon-forgot"><i class="icon icon_mail"></i></div>
              <div class="textbox-forgot">
              <img class="img_capcha" style="float: right; height: 45px;" src="captcha_code.php"/>
              <input style="width: 49%; margin-left: px; float: left" autocomplete="off" type="text" name="capcha" placeholder="Capcha" id="input-password" value="" class="form-control" />
              </div>
            </div>

            <div class="row">
              <div class="col-sm-6 for-left-btn">
                <a class="btn" href="<?php echo $back; ?>.html">GO BACK</a>
              </div>
               <?php if ($error_warning) { ?>
               <div class="text-warning"><i class="fa fa-exclamation-circle"></i>
                  <?php echo $error_warning; ?>
               </div>
               <?php } ?>
              <div class="col-sm-6 for-right-btn submit">
                <button class="btn btn-info btn-sign waves-effect waves-light" type="submit">RESET</button>
              </div>
            </div>
          </form>
          
          <!-- End Forgot password Form -->
        </div>
      </div>
    </div>
    <!-- Global Plugin JavaScript -->
    
  </body>


<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create user successfull !!!');
   }
   jQuery(document).ready(function($) {
      jQuery('.cap_code_new').click(function(){
         jQuery('.img_capcha').attr({'src':'<?php echo HTTPS_SERVER;?>captcha_code.php'});

      });
   });
</script>