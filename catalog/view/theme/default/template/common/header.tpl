<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
   <head>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title><?php echo $title; ?> </title>
      <meta http-equiv="cache-control" content="no-cache"/>
      <base href="<?php echo $base; ?>"/>
      <?php if ($description){ ?>
      <meta name="description" content="<?php echo $description; ?>"/>
      <?php } ?><?php if ($keywords){ ?>
      <meta name="keywords" content="<?php echo $keywords; ?>"/>
      <?php } ?>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link rel="icon" href="catalog/view/theme/default/img/logo_favi.png">
      <script src="catalog/view/javascript/jquery/underscorejs/underscorejs.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/jquery/jquery.easyui.min.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/jquery/jquery.quick.pagination.min.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/loading.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/bootstrap.min.js"></script>
      <script src="catalog/view/javascript/jquery.nicescroll.js" type="text/javascript"></script>
      <script src="catalog/view/javascript/jquery.app.js"></script> 
      <!--- ###################  -->
      <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300%7CRaleway:400,300%7CRoboto:400,700,300%7CLato' rel='stylesheet' type='text/css' />
        <!--  Icon CSS -->
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/iconstyle.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/fonts/material-design/material-design.min.css" />
     <link id="site-color" rel="stylesheet" href="catalog/view/theme/default/assets/css/login-page/form.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/fonts/font-awasome/font-awesome.min.css" />
     <!-- Global plugin CSS -->
     <link class="nor-css" rel="stylesheet" href="catalog/view/theme/default/assets/css/global/bootstrap.min.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/switchery/switchery.min.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/slidePanel.min.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/waves.min.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/plugin/bootstrap-tour/css/bootstrap-tour.css" />
     <!--  Global Template CSS -->
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/style.css" />
     <link id="site-color" rel="stylesheet" href="catalog/view/theme/default/assets/css/colors/default.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/responsive.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/global/site.min.css" />
     <!--  Page plugin CSS -->
     <link rel="stylesheet" href="catalog/view/theme/default/assets/fonts/font-awasome/font-awesome.min.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/sort-nestable/tasklist.min.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/calendar/fullcalendar.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/fonts/weather/weather-icons.min.css" />
     <link href="catalog/view/theme/default/assets/css/rickshaw/rickshaw.min.css" rel="stylesheet" type="text/css"/>
     <link href="catalog/view/theme/default/assets/css/morrischarts/morris.css" rel="stylesheet" type="text/css" />
     <link href="catalog/view/theme/default/assets/css/c3-chart/c3.min.css" rel="stylesheet" type="text/css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/plugin/magnific-popup/css/magnific-popup.min.css">
     <!--  Page CSS -->
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/google-map/custom-map.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/calendar/custom.css" />
     <link rel="stylesheet" href="catalog/view/theme/default/assets/css/dashboard/dashboard_v3.css" />
     <link href="catalog/view/theme/default/assets/css/c3-chart/c3.min.css" rel="stylesheet" type="text/css" />
      

      <!--- ###################  -->  
    
      <!-- <link href="catalog/view/theme/default/css/style.css" rel="stylesheet"> -->
      <link href="catalog/view/theme/default/css/customer.css" rel="stylesheet">
      <?php foreach ($styles as $style) { ?>
      <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
      <?php } ?>
      <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
      <script type="text/javascript" src="catalog/view/javascript/jquery.simplyscroll.js"></script>
      <?php foreach ($scripts as $script) { ?>
      <script src="<?php echo $script; ?>" type="text/javascript"></script>
      <?php } ?>
      <?php echo $google_analytics; ?>
      <script type="text/javascript"> window.funLazyLoad={start:function(){$("#fakeloader").fakeLoader({timeToHide:99999999999,zIndex:"999",spinner:"spinne1",bgColor:"rgba(0,0,0,0.5)"})},reset:function(){$("#fakeloader").hide()},show:function(){$("#fakeloader").show()}};
         (function($) { $(function() { $("#scroller").simplyScroll({frameRate:'20'}); }); })(jQuery)
             
      </script>
      <script src="catalog/view/javascript/jquery.form.min.js" type="text/javascript"></script><script src="catalog/view/javascript/alertifyjs/alertify.js" type="text/javascript"></script>
      <link href="catalog/view/theme/default/css/al_css/alertify.css" rel="stylesheet">
      <script src="catalog/view/javascript/changeLang.js" type="text/javascript"></script><script type="text/javascript" src="catalog/view/javascript/bxslider/jquery.bxslider.js"></script>
      <!--  <script type="text/javascript"> $(function(){$("html").niceScroll({cursorwidth:"15px",cursorcolor:"blue"})}); </script> -->
   </head>
   <body class="dashboard3 site-menu-left">
      <div id="fakeloader"></div>
      <div class="main-header navbar navbar-default navbar-fixed-top navbar-inverse navbar-mega">
            <div class="navbar-header">
                <!--  Template Logo -->
                <a class="navbar-brand" href="home.html">
                    <img class="navbar-brand-logo navbar-brand-logo-normal" src="catalog/view/theme/default/img/logo.png" title="Porish" alt="logo">
                </a>
                <div>
                    <button class="button-menu-mobile open-left waves-effect">
                        <i class="icon_menu"></i>
                    </button>
                </div>
            </div>
            <div class="navbar-container container-fluid">
                <div class="collapse navbar-collapse navbar-block navbar-collapse-toolbar" id="site-navbar-collapse">
                    <!--  Menu -->
                    
                    <ul class="nav navbar-nav navbar-toolbar navbar-right">
                        <li class="dropdown">
                            <!--  Profile Section -->
                            <a class="navbar-avatar dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="javascript:void(0)" data-animation="scale-up" role="button">
                                <span class="avatar avatar-online">
                                    <img src="catalog/view/theme/default/images/20150831_55e46ad551392.png" alt="Profile Image">
                                    <i></i>
                                </span>
                                 <?php print_r($customer['username']); ?>
                            </a>
                            <ul class="dropdown-menu dropdown-top-border position-absolute" role="menu">
                                <li role="presentation">
                                    <a href="your-profile.html" role="menuitem"><i class="icon icon_profile" aria-hidden="true"></i> Profile</a>
                                </li>
                               
                                <li role="presentation">
                                    <a href="change-login-password.html" role="menuitem"><i class="icon icon_cog" aria-hidden="true"></i> Settings</a>
                                </li>
                                <li class="divider" role="presentation"></li>
                                <li role="presentation">
                                    <a href="logout.html" role="menuitem"><i class="icon icon_lock_alt" aria-hidden="true"></i> Logout</a>
                                </li>
                            </ul>
                        </li>
                        <li id="toggleFullscreen">
                            <!--  Full Screen -->
                            <a class="icon icon-fullscreen waves-effect waves-light" id="toggle" data-toggle="fullscreen" href="javascript:void(0)" role="button">
                                <span aria-hidden="true" class="arrow_expand"></span>
                            </a>
                        </li>
                        <li class="dropdown">
                            <!--  Notification Box -->
                            <a class="waves-effect waves-light" data-toggle="dropdown" href="javascript:void(0)" title="Notifications" data-animation="scale-up" role="button">
                                <i class="icon icon_document_alt" aria-hidden="true"></i>
                                <span class="badge badge-danger up">0</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media dropdown-top-border position-absolute" role="menu">
                                <li class="dropdown-menu-header" role="presentation">
                                    <h5>NEW UPDATES
                                        <a class="dropdown-menu-noti-btn" href="javascript:void(0)" role="button">
                                            <i class="icon icon_cog" aria-hidden="true"></i>
                                        </a>
                                    </h5>
                                    <span class="label label-round label-danger">New 0</span>
                                </li>
                                <li class="list-group hover-item" role="presentation">
                                    <div data-role="container">
                                        <div data-role="content">
                                            <!-- <a class="list-group-item" href="javascript:void(0)" role="menuitem">
                                                <div class="media">
                                                    <div class="media-left padding-right-10">
                                                        <i class="icon icon_documents_alt bg-red white icon-circle" aria-hidden="true"></i>
                                                    </div>
                                                    <div class="media-body">
                                                        <h6 class="media-heading">New tasks needs to be done</h6>
                                                        <time class="media-meta" datetime="2015-06-12T20:50:48+08:00">2 min ago</time>
                                                    </div>
                                                    <div class="media-right">
                                                        <div class="btn-group">
                                                            <span class="btn btn-info btn-sm waves-effect waves-dark"><i class="icon_check"></i></span>
                                                            <span class="btn btn-default btn-sm waves-effect waves-dark">
                                                                <i class="icon_cog"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                             -->
                                        </div>
                                    </div>
                                </li>
                                <li class="dropdown-menu-footer" role="presentation">
                                    <a href="javascript:void(0)" role="menuitem">
                                        All notifications
                                    </a>
                                </li>
                            </ul>
                        </li>
                       
                        <li class="dropdown">
                            <!-- Flag Box -->
                            <a class="icon flag-avtar dropdown-toggle waves-effect waves-light" data-animation="scale-up" data-toggle="dropdown" href="javascript:void(0)" role="button">
                                <span aria-hidden="true" class="flag-icon flag-icon-background flag-icon-us"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-top-border position-absolute language-box" role="menu">
                                <li class="active" role="presentation">
                                    <a class="waves-effect waves-light" href="javascript:void(0)" role="menuitem"><span aria-hidden="true" class="icon flag-icon flag-icon-background flag-icon-us"></span><span class="flag-country" data-country='us'>US</span></a>
                                </li>
                                <li role="presentation">
                                    <a class="waves-effect waves-light" href="javascript:void(0)" role="menuitem"><span aria-hidden="true" class="icon flag-icon flag-icon-background flag-icon-au"></span><span class="flag-country" data-country='au'>AU</span></a>
                                </li>
                                <li role="presentation">
                                    <a class="waves-effect waves-light" href="javascript:void(0)" role="menuitem"><span aria-hidden="true" class="icon flag-icon flag-icon-background flag-icon-in"></span><span class="flag-country" data-country='in'>IN</span></a>
                                </li>
                                <li role="presentation">
                                    <a class="waves-effect waves-light" href="javascript:void(0)" role="menuitem"><span aria-hidden="true" class="icon flag-icon flag-icon-background flag-icon-pt"></span><span class="flag-country" data-country='pt'>PT</span></a>
                                </li>
                                <li role="presentation">
                                    <a class="waves-effect waves-light" href="javascript:void(0)" role="menuitem"><span aria-hidden="true" class="icon flag-icon flag-icon-background flag-icon-de"></span><span class="flag-country" data-country='de'>DE</span></a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                
            </div>
        </div>