<?php $self->document->setTitle("Home"); echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left'); ?>
<div class="main-content">
    <div class="page-content container-fluid">
        <div class="main-dashboard">
            <?php if (intval($user) > 0) {  ?>
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-info">
          <div class="panel-heading" style="background: #31708f">
            <h3 class="panel-title">New user Register</h3>
          </div>
          <div class="panel-body" style=" margin-top: 25px; ">
            <div class="">
                <u>Please follow this link to view details:</u> <a href="user.html" class="btn btn-danger">View Detail</a>
            </div>
          </div>
        </div>
            </div>

        </div>
        <?php } ?>
            <div class="row">
                <!-- Start Box Section -->
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-blue tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Total Investment</h6>
                            <h1 class="mb-1"><?php echo $countPD; ?> BTC</p></h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-blue tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Daily profit</h6>
                            <h1 class="mb-1"><?php echo $getR_Wallet_payment; ?> BTC</p></h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-blue tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Pairing bonus</h6>
                            <h1 class="mb-1"><?php echo $getCNWallet; ?> BTC</p></h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-blue tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Refferal bonus</h6>
                            <h1 class="mb-1"><?php echo $getCWallet; ?> BTC</p></h1>
                        </div>
                    </div>
                </div>    
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-white tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content t-content_custom">
                            <h6 class=" mb-1">ID / Left</h6>
                            <h1 class="mb-1"><?php echo $total_binary_left; ?></p></h1>
                        </div>
                        <div class="t-content t-content_custom text-right">
                            <h6 class=" mb-1">ID / Right</h6>
                            <h1 class="mb-1"><?php echo $total_binary_right; ?></p></h1>
                        </div>
                    </div>
                </div>        
                  
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-white tile tile-1 mb-2" style="padding-top: 0px;">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content t-content_custom">
                            <h6 class=" mb-1">Volume - Left </h6>
                            <h1 class="mb-1"><?php echo $total_pd_left; ?> BTC</p></h1>
                            <h5><?php echo $customer_new['pd_left']/100000000 ?> BTC</h5>
                        </div>
                        <div class="t-content t-content_custom text-right">
                            <h6 class=" mb-1">Volume - Right </h6>
                            <h1 class="mb-1"><?php echo $total_pd_right; ?> BTC</p></h1>
                            <h5><?php echo $customer_new['pd_right']/100000000 ?> BTC</h5>
                        </div>
                    </div>
                </div> 
                
                   
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-white tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Leader Bonus</h6>
                            <h1 class="mb-1"><?php
                            switch ($danhhieu) {
                                case 1:
                                    $ten = "Gold";
                                    $btcoin = 1;
                                    break;
                                case 2:
                                    $ten = "Ruby";
                                    $btcoin = 2;
                                    break;
                                case 3:
                                    $ten = "Emeral";
                                    $btcoin = 4;
                                    break;
                                case 4:
                                    $ten = "Diamond";
                                    $btcoin = 6;
                                    break;
                                case 5:
                                    $ten = "Blue Diamond";
                                    $btcoin = 8;
                                    break;
                                case 6:
                                    $ten = "Black Diamond";
                                    $btcoin = 10;
                                    break;
                                default:
                                    $ten = "Not level";
                                    $btcoin = 0;
                                    break;
                            }
                            ?><p></h1>
                            <h1 class="mb-1"><span class="pull-left"></span><span class="pull-left"><?php echo $randprofit ?> BTC</span></p></h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-white tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Matching Bonus</h6>
                            <h1 class="mb-1">0 BTC</p></h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-red tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Reinvestment</h6>
                            <h1 class="mb-1"><?php echo $taidautu; ?> BTC</p></h1>
                        </div>
                    </div>
                </div>
                <a href="transfer.html">
                 <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-red tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content t-content_custom" style="width: 50%">
                            <h6 class=" mb-1">Total Sfccoin</h6>
                            <h1 class="mb-1">0 Sfccoin <!-- <img style="width: 25px; margin-top: -4px;" src="catalog/view/theme/default/images/sfccoin.png" alt=""> --></p> </h1>

                        </div>
                        <div class="t-content t-content_custom text-right" style="width: 50%">
                            <h6 class=" mb-1" >Price</h6>
                            <h1 class="mb-1" >0.0008 BTC</p></h1>
                        </div>
                        
                    </div>
                </div>
                </a>
                <a href="mining.html">
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-red tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content t-content_custom" style="width: 40%">
                            <h6 class=" mb-1" >Token</h6>
                            <h1 class="mb-1"><?php echo number_format($wallet_token) ?></p></h1>
                        </div>
                        <div class="t-content t-content_custom text-right" style="width: 60%">
                            <h6 class=" mb-1" >Price</h6>
                            <h1 class="mb-1" >0.000025 BTC</p></h1>
                        </div>
                    </div>
                </div>
                </a>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-red tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content t-content_custom" style="width: 40%">
                            <h6 class=" mb-1">Difficulty</h6>
                            <h1 class="mb-1">25 Token</p></h1>
                        </div>
                        <!-- <div class="t-content t-content_custom text-right" style="width: 60%">
                            <h6 class=" mb-1" >Rate</h6>
                            <h1 class="mb-1" >0.000025 BTC</p></h1>
                        </div> -->
                    </div>
                </div>
                <h3 style="margin-top: 30px; float: left;width: 100%" class="text-center">List Investment</h3>    

                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                    <div class="bg-white widget widgett-shadow">
                        <?php $packet = $self -> check_packet_pd (50000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                            <div class="ribbon-wrapper">
                                <?php if (intval($packet['status']) === 0) {?>
                                <div class="ribbon-design">Watting</div>
                                <?php } else { ?>
                                <div class="ribbon-design red">Actived</div>
                                <?php }?>
                            </div>
                        <?php }?>
                        <div class="bg-info bg-yl white padding-30 padding-bottom-20 <?php echo $class ?>">
                            <div class="card-action">
                                <span class="sparkline-bar2">0.5 BTC</span>
                            </div>
                            <div class="widget-font-20 clearfix text-center">
                                120 Days
                            </div>
                            <div class="widget-font-20 clearfix text-center">
                                2% Daily
                            </div>
                        </div>
                        <div class="widgets-top-padding padding-30 padding-bottom-10">
                            <div class="row no-space">
                                <div class="col-xs-12 text-center">
                                    <p><span class="icon md-circle circle-success"></span>120 Days </p>
                                    <p class="margin-bottom-10">
                                        <span class="icon md-circle circle-blue"></span>Daily profit: 0.01 BTC
                                    </p>
                                </div>
                                
                                <div class="card-action">
                                    <?php if (count($packet) === 0) {?>
                                    <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                        <input type="hidden" name="invest" value="50000000">
                                        <button class="btn btn-sm animated-btn btn-tran btn-border-warning  btn-bg-warning thar-three waves-effect waves-light">Upgrade Now</button>
                                    </form>
                                    <?php } else {?>
                                    <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                        <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                        <button class="btn btn-sm animated-btn btn-tran btn-border-success btn-bg-success  thar-three waves-effect waves-light">Reviews</button>
                                    </form>
                                    <?php } ?>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (100000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                            <div class="ribbon-wrapper">
                                <?php if (intval($packet['status']) === 0) {?>
                                <div class="ribbon-design">Watting</div>
                                <?php } else { ?>
                                <div class="ribbon-design red">Actived</div>
                                <?php }?>
                            </div>
                        <?php }?>
                            <div class="bg-info bg-bl white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">1 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    120 Days
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    2.1% Daily
                                </div>
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>120 Days  </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.021 BTC
                                        </p>
                                        
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="100000000">
                                            <button class="btn btn-sm animated-btn btn-tran btn-border-warning  btn-bg-warning thar-three waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm animated-btn btn-tran btn-border-success btn-bg-success  thar-three waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (500000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                            <div class="ribbon-wrapper">
                                <?php if (intval($packet['status']) === 0) {?>
                                <div class="ribbon-design">Watting</div>
                                <?php } else { ?>
                                <div class="ribbon-design red">Actived</div>
                                <?php }?>
                            </div>
                        <?php }?>
                            <div class="bg-info bg-bls white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">5 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    120 Days
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    2.2% Daily
                                </div>
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>120 Days  </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.11 BTC
                                        </p>
                                        
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="500000000">
                                            <button class="btn btn-sm animated-btn btn-tran btn-border-warning  btn-bg-warning thar-three waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm animated-btn btn-tran btn-border-success btn-bg-success  thar-three waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (1000000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                            <div class="ribbon-wrapper">
                                <?php if (intval($packet['status']) === 0) {?>
                                <div class="ribbon-design">Watting</div>
                                <?php } else { ?>
                                <div class="ribbon-design red">Actived</div>
                                <?php }?>
                            </div>
                        <?php }?>
                            <div class="bg-info bg-gr white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">10 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    120 Days
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    2.3% Daily
                                </div>
                                
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>120 Days </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.23 BTC
                                        </p>
                                       
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="1000000000">
                                            <button class="btn btn-sm animated-btn btn-tran btn-border-warning  btn-bg-warning thar-three waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm animated-btn btn-tran btn-border-success btn-bg-success  thar-three waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (2000000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                            <div class="ribbon-wrapper">
                                <?php if (intval($packet['status']) === 0) {?>
                                <div class="ribbon-design">Watting</div>
                                <?php } else { ?>
                                <div class="ribbon-design red">Actived</div>
                                <?php }?>
                            </div>
                        <?php }?>
                            <div class="bg-info bg-grs white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">20 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    120 Days
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    2.4% Daily
                                </div>
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>120 Days </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.24 BTC
                                        </p>
                                       
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="2000000000">
                                            <button class="btn btn-sm animated-btn btn-tran btn-border-warning  btn-bg-warning thar-three waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm animated-btn btn-tran btn-border-success btn-bg-success  thar-three waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (5000000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                            <div class="ribbon-wrapper">
                                <?php if (intval($packet['status']) === 0) {?>
                                <div class="ribbon-design">Watting</div>
                                <?php } else { ?>
                                <div class="ribbon-design red">Actived</div>
                                <?php }?>
                            </div>
                        <?php }?>
                            <div class="bg-info bg-blue white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">50 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    120 Days
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    2.5% Daily
                                </div>
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>120 Days  </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 1.25 BTC
                                        </p>
                                        
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="5000000000">
                                            <button class="btn btn-sm animated-btn btn-tran btn-border-warning  btn-bg-warning thar-three waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm animated-btn btn-tran btn-border-success btn-bg-success  thar-three waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

<script type="text/javascript">
    if (location.hash === '#success') {
        alertify.set('notifier', 'delay', 100000000);
        alertify.set('notifier', 'position', 'top-right');
        alertify.success('Create user successfull !!!');
    }
</script>
<script type="text/javascript">
        $(document).ready(function() {
            var isshow = localStorage.getItem('isshow');
            var node = "<p><small>11/11/2016 01:00 AM</small><br></p><p>Dear all members !</p><p>We are going to enter stage one and implement the very first functionalities for the community: Coinmax Pay and Coinmax Exchange. Please update your information in the new form located in the 'profile' session. <br><br>All inquiries, questions please contact us via <a href='#'>support@coinmax.biz!</a></p><br><p>Sincerely yours.<br>Coinmax team.!</p>";
            // if (isshow== null) {
                // localStorage.setItem('isshow', 1);
                //alertify.alert(node);
            // }  
        });
    </script>
<?php echo $self->load->controller('common/footer') ?>