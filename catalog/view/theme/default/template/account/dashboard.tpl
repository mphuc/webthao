<?php $self->document->setTitle("Home"); echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left'); ?>
<div class="main-content">
    <div class="page-content container-fluid">
        <div class="main-dashboard">
            <div class="row">
                <!-- Start Box Section -->
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-white tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Total Investment</h6>
                            <h1 class="mb-1"><?php echo $countPD; ?> BTC</p></h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-white tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Daily profit</h6>
                            <h1 class="mb-1"><?php echo $getR_Wallet_payment; ?> BTC</p></h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-white tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Pairing bonus</h6>
                            <h1 class="mb-1"><?php echo $getCNWallet; ?> BTC</p></h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-white tile tile-1 mb-2">
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
                        <div class="t-content">
                            <h6 class=" mb-1">ID / Left</h6>
                            <h1 class="mb-1"><?php echo $total_binary_left; ?></p></h1>
                        </div>
                    </div>
                </div>        
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-white tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">ID / Right</h6>
                            <h1 class="mb-1"><?php echo $total_binary_right; ?></p></h1>
                        </div>
                    </div>
                </div>    
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-white tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Volume - Left </h6>
                            <h1 class="mb-1"><?php echo $total_pd_left; ?></p></h1>
                        </div>
                    </div>
                </div> 
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="box box-block bg-white tile tile-1 mb-2">
                        <div class="t-icon right"><span class="bg-danger"></span><i class="fa fa-btc" aria-hidden="true"></i></div>
                        <div class="t-content">
                            <h6 class=" mb-1">Volume - Right </h6>
                            <h1 class="mb-1"><?php echo $total_pd_right; ?></p></h1>
                        </div>
                    </div>
                </div>     
                   
                <h3 style="margin-top: 30px; float: left;width: 100%" class="text-center">List Investment</h3>    

                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                    <div class="bg-white widget widgett-shadow">
                        <?php $packet = $self -> check_packet_pd (15000000) ;?>
                        <?php $class = ""; if(count($packet) > 0) $class = "active";?>
                        <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                            <div class="card-action">
                                <span class="sparkline-bar2">1.2 BTC</span>
                            </div>
                            <div class="widget-font-20 clearfix">
                                Days
                                <span class="pull-right">
                                    <i class="icon md-caret-up" aria-hidden="true"></i> 60
                                </span>
                            </div>
                            <div class="font-size-14 red-200 clearfix">
                                2.5% Daily
                                <span class="pull-right">+ 1.1 BTC</span>
                            </div>
                            
                        </div>
                        <div class="widgets-top-padding padding-30 padding-bottom-10">
                            <div class="row no-space">
                                <div class="col-xs-12 text-center">
                                    <p><span class="icon md-circle circle-success"></span>60 days: 11.52 BTC + 9.6 BTC </p>
                                    <p class="margin-bottom-10">
                                        <span class="icon md-circle circle-blue"></span>Daily profit: 0.192 BTC
                                    </p>
                                    <p class="margin-bottom-20">
                                        <span class="icon md-circle circle-blue"></span>Fee : 0.64 BTC 
                                    </p>
                                </div>
                                
                                <div class="card-action">
                                    <?php if (count($packet) === 0) {?>
                                    <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                        <input type="hidden" name="invest" value="0">
                                        <button class="btn btn-default animated-btn effects-four waves-effect waves-light">Upgrade Now</button>
                                    </form>
                                    <?php } else {?>
                                    <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                        <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                        <button class="btn btn-sm btn-warning animated-btn effects-four waves-effect waves-light">Reviews</button>
                                    </form>
                                    <?php } ?>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (30000000) ;?>
                            <?php $class = ""; if(count($packet) > 0) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">1.2 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix">
                                    Days
                                    <span class="pull-right">
                                        <i class="icon md-caret-up" aria-hidden="true"></i> 60
                                    </span>
                                </div>
                                <div class="font-size-14 red-200 clearfix">
                                    2.5% Daily
                                    <span class="pull-right">+ 1.1 BTC</span>
                                </div>
                                
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>60 days: 11.52 BTC + 9.6 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.192 BTC
                                        </p>
                                        <p class="margin-bottom-20">
                                            <span class="icon md-circle circle-blue"></span>Fee : 0.64 BTC 
                                        </p>
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="0">
                                            <button class="btn btn-default animated-btn effects-four waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm btn-warning animated-btn effects-four waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (30000000) ;?>
                            <?php $class = ""; if(count($packet) > 0) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">1.2 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix">
                                    Days
                                    <span class="pull-right">
                                        <i class="icon md-caret-up" aria-hidden="true"></i> 60
                                    </span>
                                </div>
                                <div class="font-size-14 red-200 clearfix">
                                    2.5% Daily
                                    <span class="pull-right">+ 1.1 BTC</span>
                                </div>
                                
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>60 days: 11.52 BTC + 9.6 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.192 BTC
                                        </p>
                                        <p class="margin-bottom-20">
                                            <span class="icon md-circle circle-blue"></span>Fee : 0.64 BTC 
                                        </p>
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="0">
                                            <button class="btn btn-default animated-btn effects-four waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm btn-warning animated-btn effects-four waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (30000000) ;?>
                            <?php $class = ""; if(count($packet) > 0) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">1.2 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix">
                                    Days
                                    <span class="pull-right">
                                        <i class="icon md-caret-up" aria-hidden="true"></i> 60
                                    </span>
                                </div>
                                <div class="font-size-14 red-200 clearfix">
                                    2.5% Daily
                                    <span class="pull-right">+ 1.1 BTC</span>
                                </div>
                                
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>60 days: 11.52 BTC + 9.6 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.192 BTC
                                        </p>
                                        <p class="margin-bottom-20">
                                            <span class="icon md-circle circle-blue"></span>Fee : 0.64 BTC 
                                        </p>
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="0">
                                            <button class="btn btn-default animated-btn effects-four waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm btn-warning animated-btn effects-four waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (30000000) ;?>
                            <?php $class = ""; if(count($packet) > 0) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">1.2 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix">
                                    Days
                                    <span class="pull-right">
                                        <i class="icon md-caret-up" aria-hidden="true"></i> 60
                                    </span>
                                </div>
                                <div class="font-size-14 red-200 clearfix">
                                    2.5% Daily
                                    <span class="pull-right">+ 1.1 BTC</span>
                                </div>
                                
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>60 days: 11.52 BTC + 9.6 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.192 BTC
                                        </p>
                                        <p class="margin-bottom-20">
                                            <span class="icon md-circle circle-blue"></span>Fee : 0.64 BTC 
                                        </p>
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="0">
                                            <button class="btn btn-default animated-btn effects-four waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm btn-warning animated-btn effects-four waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (30000000) ;?>
                            <?php $class = ""; if(count($packet) > 0) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">1.2 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix">
                                    Days
                                    <span class="pull-right">
                                        <i class="icon md-caret-up" aria-hidden="true"></i> 60
                                    </span>
                                </div>
                                <div class="font-size-14 red-200 clearfix">
                                    2.5% Daily
                                    <span class="pull-right">+ 1.1 BTC</span>
                                </div>
                                
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>60 days: 11.52 BTC + 9.6 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.192 BTC
                                        </p>
                                        <p class="margin-bottom-20">
                                            <span class="icon md-circle circle-blue"></span>Fee : 0.64 BTC 
                                        </p>
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="0">
                                            <button class="btn btn-default animated-btn effects-four waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm btn-warning animated-btn effects-four waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (30000000) ;?>
                            <?php $class = ""; if(count($packet) > 0) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">1.2 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix">
                                    Days
                                    <span class="pull-right">
                                        <i class="icon md-caret-up" aria-hidden="true"></i> 60
                                    </span>
                                </div>
                                <div class="font-size-14 red-200 clearfix">
                                    2.5% Daily
                                    <span class="pull-right">+ 1.1 BTC</span>
                                </div>
                                
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>60 days: 11.52 BTC + 9.6 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.192 BTC
                                        </p>
                                        <p class="margin-bottom-20">
                                            <span class="icon md-circle circle-blue"></span>Fee : 0.64 BTC 
                                        </p>
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="0">
                                            <button class="btn btn-default animated-btn effects-four waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm btn-warning animated-btn effects-four waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (30000000) ;?>
                            <?php $class = ""; if(count($packet) > 0) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">1.2 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix">
                                    Days
                                    <span class="pull-right">
                                        <i class="icon md-caret-up" aria-hidden="true"></i> 60
                                    </span>
                                </div>
                                <div class="font-size-14 red-200 clearfix">
                                    2.5% Daily
                                    <span class="pull-right">+ 1.1 BTC</span>
                                </div>
                                
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>60 days: 11.52 BTC + 9.6 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.192 BTC
                                        </p>
                                        <p class="margin-bottom-20">
                                            <span class="icon md-circle circle-blue"></span>Fee : 0.64 BTC 
                                        </p>
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="0">
                                            <button class="btn btn-default animated-btn effects-four waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm btn-warning animated-btn effects-four waves-effect waves-light">Reviews</button>
                                        </form>
                                        <?php } ?>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="bg-white widget widgett-shadow">
                            <?php $packet = $self -> check_packet_pd (30000000) ;?>
                            <?php $class = ""; if(count($packet) > 0) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">1.2 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix">
                                    Days
                                    <span class="pull-right">
                                        <i class="icon md-caret-up" aria-hidden="true"></i> 60
                                    </span>
                                </div>
                                <div class="font-size-14 red-200 clearfix">
                                    2.5% Daily
                                    <span class="pull-right">+ 1.1 BTC</span>
                                </div>
                                
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>60 days: 11.52 BTC + 9.6 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.192 BTC
                                        </p>
                                        <p class="margin-bottom-20">
                                            <span class="icon md-circle circle-blue"></span>Fee : 0.64 BTC 
                                        </p>
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="0">
                                            <button class="btn btn-default animated-btn effects-four waves-effect waves-light">Upgrade Now</button>
                                        </form>
                                        <?php } else {?>
                                        <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                            <button class="btn btn-sm btn-warning animated-btn effects-four waves-effect waves-light">Reviews</button>
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