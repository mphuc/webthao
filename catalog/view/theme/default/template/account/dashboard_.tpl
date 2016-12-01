<?php $self->document->setTitle("Home"); echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left'); ?>

<div class="page-title">
  <h3 class="title">DASHBOARD</h3>
</div>


<div class="wraper container-fluid">
    <div class="row none-chart">
    <div class="dash-title">
        <h3 class="panel-title">
            Your Profit
        </h3>
    </div>
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <div class="widget-panel widget-style-2 white-bg">
                <div class="tile-image">Total Investment</div>
                <div class="tile-footer">
                    <p class="m-0 counter pd-count" ><?php echo $countPD; ?> BTC</p>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <div class="widget-panel widget-style-2 white-bg">
                <div class="dash-item">
                    <div class="tile-image">Daily profit</div>
                    <div class="tile-footer">
                        <p class="m-0 counter c-wallet" ><?php echo $getR_Wallet_payment; ?> BTC</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <div class="widget-panel widget-style-2 white-bg"> 
                <div class="tile-image"> Pairing bonus </div>
                <div class="tile-footer">
                    <p class="m-0 counter r-wallet"><?php echo $getCNWallet ?> BTC</p>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <div class="widget-panel widget-style-2 white-bg">
                <div class="tile-image"> Refferal bonus </div>
                <div class="tile-footer">
                    <p class="m-0 counter cn-wallet"><?php echo $getCWallet ?> BTC</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="dash-title">
            <h3 class="panel-title">
                Tree Reviews
            </h3>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <div class="widget-panel widget-style-2 white-bg">
                <div class="dash-item">
                    <div class="tile-image"> ID / Left </div>
                    <a href="tree" style="color:#fff;">
                        <div class="tile-footer">
                            <p class="m-0 counter total_left"><?php echo $total_binary_left ;?></p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <div class="widget-panel widget-style-2 white-bg">
                <div class="tile-image"> ID /  Right </div>
                <a href="tree" style="color:#fff;">
                    <div class="tile-footer">
                        <p class="m-0 counter total_right"><?php echo $total_binary_right ?></p>
                    </div>
                </a>
                
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <div class="widget-panel widget-style-2 white-bg">
                <div class="tile-image"> Volume - Left </div>
                <a href="tree" style="color:#fff;">
                    <div class="tile-footer">
                        <p class="m-0 counter total_pd_left" ><?php echo $total_pd_left; ?> BTC</p>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <div class="widget-panel widget-style-2 white-bg">
                <div class="dash-item">
                    <div class="tile-image">  Volume - Right </div>
                    <a href="tree" style="color:#fff;">
                        <div class="tile-footer">
                            <p class="m-0 counter total_pd_right"><?php echo $total_pd_right ?> BTC</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
  
    <div class="row">
        <div class="panel" style="border:0px">
            <div class="panel-heading" style="background:none">
               <span class="panel-title">List of investment</span>
            </div>
            <div class="panel-body">
              <h2 class="text-center" style="margin-bottom: 20px;">Investment by BTC</h2>
               <div class="plans-panel" style="max-width: 1050px;">
                  <div class="plans-container text-center">

                     <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_red">
                        <?php $packet = $self -> check_packet_pd (15000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                           <div class="ribbon-wrapper">
                              <?php if (intval($packet['status']) === 0) {?>
                                 <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                              <?php } else { ?>
                                 <div class="ribbon-design red">Actived</div>
                              <?php }?>
                           </div>
                        <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">0.15</span>
                                 <span class="deposite_time_text">BTC</span>
                              </div>
                           </div>
                        
                           <div class="deposite_info">
                              <span>60 days: 0.18 BTC + 0.15 BTC</span>
                              <br/>
                              <span>Daily profit: 0.003 BTC</span><br>
                              <span>
                                 Fee : 0.01 BTC
                              </span>
                              <br/>
                              <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="0">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                              
                              
                           </div>
                        </div>
                     </div>

                     <!-- Personal plan -->
                     <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_red">
                          <?php $packet = $self -> check_packet_pd (30000000) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>

                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">0.3</span>
                                 <span class="deposite_time_text">BTC</span>
                              </div>
                           </div>
                        
                           <div class="deposite_info">
                              <span>60 days: 0.36 BTC + 0.3 BTC</span>
                              <br/>
                              <span>Daily profit: 0.006 BTC</span><br>
                              <span>
                                Fee : 0.02 BTC
                              </span>
                              <br/>
                              <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="1">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                              
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_orange">
                           <?php $packet = $self -> check_packet_pd (60000000) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">0.6</span>
                                 <span class="deposite_time_text">BTC</span>
                              </div>
                           </div>
                      
                           <div class="deposite_info">
                              <span>60 days: 0.72 BTC + 0.6 BTC</span>
                              <br/>
                              <span>Daily profit: 0.012 BTC</span><br>
                              <span>
                                Fee : 0.04 BTC
                              </span>
                              <br/>
                              <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="2">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                           </div>
                          
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_green">
                           <?php $packet = $self -> check_packet_pd (120000000) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">1.2</span>
                                 <span class="deposite_time_text">BTC</span>
                              </div>
                           </div>
                      
                           <div class="deposite_info">
                              <span>60 days: 1.44 BTC + 1.2 BTC</span>
                              <br/>
                              <span>Daily profit: 0.024 BTC</span><br>
                              <span>
                                Fee : 0.08 BTC
                              </span>
                              <br/>
                              <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="3">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_cyan">
                           <?php $packet = $self -> check_packet_pd (240000000) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">2.4</span>
                                 <span class="deposite_time_text">BTC</span>
                              </div>
                           </div>
                           
                           <div class="deposite_info">
                              <span>60 days: 2.88 BTC + 2.4 BTC</span>
                              <br/>
                              <span>Daily profit: 0.048 BTC</span><br>
                              <span>
                                Fee : 0.16 BTC
                              </span>
                              <br/>
                               <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="4">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_blue">
                           <?php $packet = $self -> check_packet_pd (480000000) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">4.8</span>
                                 <span class="deposite_time_text">BTC</span>
                              </div>
                           </div>
                         
                           <div class="deposite_info">
                              <span>60 days: 5.76 BTC + 4.8 BTC</span>
                              <br/>
                              <span>Daily profit: 0.096 BTC</span><br>
                              <span>
                                Fee : 0.32 BTC
                              </span>
                              <br/>
                              <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="5">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                           </div>
                     
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_purple">
                           <?php $packet = $self -> check_packet_pd (960000000) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">9.6</span>
                                 <span class="deposite_time_text">BTC</span>
                              </div>
                           </div>
                    
                           <div class="deposite_info">
                              <span>60 days: 11.52 BTC + 9.6 BTC</span>
                              <br/>
                              <span>Daily profit: 0.192 BTC</span><br>
                              <span>
                                Fee : 0.64 BTC
                              </span>
                              <br/>
                             <!--  <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="6">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?> -->
                           </div>
              
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_purple">
                           <?php $packet = $self -> check_packet_pd (1920000000) ;?>
                           <?php if(count($packet) > 0) { ?>
                              <div class="ribbon-wrapper">
                                 <?php if (intval($packet['status']) === 0) {?>
                                    <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                                 <?php } else { ?>
                                    <div class="ribbon-design red">Actived</div>
                                 <?php }?>
                              </div>
                           <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">19.2</span>
                                 <span class="deposite_time_text">BTC</span>
                              </div>
                           </div>
                    
                           <div class="deposite_info">
                              <span>60 days: 23.04 BTC + 19.2 BTC</span>
                              <br/>
                              <span>Daily profit: 0.384 BTC</span><br>
                              <span>
                                 Fee : 1.28 BTC
                              </span>
                              <br/>
                              <!--  <?php if (count($packet) === 0) {?>
                                 <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="7">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide" action="<?php echo $self->url->link('account/pd/packet_invoide', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?> -->
                           </div>
              
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            
           
            <h2 class="text-center" style="margin-bottom: 20px;">Investment by VND (Updating...)</h2>
            <div class="panel-body">
               <div class="plans-panel" style="max-width: 1050px;">
                  <div class="plans-container text-center">

                     <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_red">
                        <?php $packet = $self -> check_packet_pd_VND (15000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                           <div class="ribbon-wrapper">
                              <?php if (intval($packet['status']) === 0) {?>
                                 <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                              <?php } else { ?>
                                 <div class="ribbon-design red">Actived</div>
                              <?php }?>
                           </div>
                        <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">600</span>
                                 <span class="deposite_time_text">VND</span>
                              </div>
                           </div>
                        
                           <div class="deposite_info">
                              <span>60 days: 720 VND + 600 VND</span>
                              <br/>
                              <span>Daily profit: 12 VND</span><br>
                              <span>
                                 Fee : 36 VND
                              </span>
                              <br/>
                              <?php if (count($packet) === 0 ) {?>
                                 <form method="GET" class="packet-invest-VND" action="<?php echo $self->url->link('account/pd/pd_investment_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="0">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide-VND" action="<?php echo $self->url->link('account/pd/packet_invoide_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                              
                              
                           </div>
                        </div>
                     </div>

                    <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_red">
                        <?php $packet = $self -> check_packet_pd_VND (15000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                           <div class="ribbon-wrapper">
                              <?php if (intval($packet['status']) === 0) {?>
                                 <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                              <?php } else { ?>
                                 <div class="ribbon-design red">Actived</div>
                              <?php }?>
                           </div>
                        <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">1200</span>
                                 <span class="deposite_time_text">VND</span>
                              </div>
                           </div>
                        
                           <div class="deposite_info">
                              <span>60 days: 1440 VND + 1200 VND</span>
                              <br/>
                              <span>Daily profit: 24 VND</span><br>
                              <span>
                                 Fee : 36 VND
                              </span>
                              <br/>
                              <?php if (count($packet) === 0 ) {?>
                                 <form method="GET" class="packet-invest-VND" action="<?php echo $self->url->link('account/pd/pd_investment_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="0">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide-VND" action="<?php echo $self->url->link('account/pd/packet_invoide_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                              
                              
                           </div>
                        </div>
                     </div>

                     <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_red">
                        <?php $packet = $self -> check_packet_pd_VND (15000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                           <div class="ribbon-wrapper">
                              <?php if (intval($packet['status']) === 0) {?>
                                 <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                              <?php } else { ?>
                                 <div class="ribbon-design red">Actived</div>
                              <?php }?>
                           </div>
                        <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">2400</span>
                                 <span class="deposite_time_text">VND</span>
                              </div>
                           </div>
                        
                           <div class="deposite_info">
                              <span>60 days: 2880 VND + 2400 VND</span>
                              <br/>
                              <span>Daily profit: 48 VND</span><br>
                              <span>
                                 Fee : 72 VND
                              </span>
                              <br/>
                              <?php if (count($packet) === 0 ) {?>
                                 <form method="GET" class="packet-invest-VND" action="<?php echo $self->url->link('account/pd/pd_investment_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="0">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide-VND" action="<?php echo $self->url->link('account/pd/packet_invoide_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                              
                              
                           </div>
                        </div>
                     </div>

                      <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_red">
                        <?php $packet = $self -> check_packet_pd_VND (15000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                           <div class="ribbon-wrapper">
                              <?php if (intval($packet['status']) === 0) {?>
                                 <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                              <?php } else { ?>
                                 <div class="ribbon-design red">Actived</div>
                              <?php }?>
                           </div>
                        <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">4800</span>
                                 <span class="deposite_time_text">VND</span>
                              </div>
                           </div>
                        
                           <div class="deposite_info">
                              <span>60 days: 5760 VND + 4800 VND</span>
                              <br/>
                              <span>Daily profit: 96 VND</span><br>
                              <span>
                                 Fee : 144 VND
                              </span>
                              <br/>
                              <?php if (count($packet) === 0 ) {?>
                                 <form method="GET" class="packet-invest-VND" action="<?php echo $self->url->link('account/pd/pd_investment_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="0">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide-VND" action="<?php echo $self->url->link('account/pd/packet_invoide_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                              
                              
                           </div>
                        </div>
                     </div>
                      
                      <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_red">
                        <?php $packet = $self -> check_packet_pd_VND (15000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                           <div class="ribbon-wrapper">
                              <?php if (intval($packet['status']) === 0) {?>
                                 <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                              <?php } else { ?>
                                 <div class="ribbon-design red">Actived</div>
                              <?php }?>
                           </div>
                        <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">9600</span>
                                 <span class="deposite_time_text">VND</span>
                              </div>
                           </div>
                        
                           <div class="deposite_info">
                              <span>60 days: 11520 VND + 9600 VND</span>
                              <br/>
                              <span>Daily profit: 192 VND</span><br>
                              <span>
                                 Fee : 288 VND
                              </span>
                              <br/>
                              <?php if (count($packet) === 0 ) {?>
                                 <form method="GET" class="packet-invest-VND" action="<?php echo $self->url->link('account/pd/pd_investment_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="0">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide-VND" action="<?php echo $self->url->link('account/pd/packet_invoide_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                              
                           </div>
                        </div>
                     </div>

                     <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_red">
                        <?php $packet = $self -> check_packet_pd_VND (15000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                           <div class="ribbon-wrapper">
                              <?php if (intval($packet['status']) === 0) {?>
                                 <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                              <?php } else { ?>
                                 <div class="ribbon-design red">Actived</div>
                              <?php }?>
                           </div>
                        <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">19200</span>
                                 <span class="deposite_time_text">VND</span>
                              </div>
                           </div>
                        
                           <div class="deposite_info">
                              <span>60 days: 23040 VND + 19200 VND</span>
                              <br/>
                              <span>Daily profit: 384 VND</span><br>
                              <span>
                                 Fee : 576 VND
                              </span>
                              <br/>
                              <?php if (count($packet) === 0 ) {?>
                                 <form method="GET" class="packet-invest-VND" action="<?php echo $self->url->link('account/pd/pd_investment_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="0">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide-VND" action="<?php echo $self->url->link('account/pd/packet_invoide_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                              
                           </div>
                        </div>
                     </div>

                    <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_red">
                        <?php $packet = $self -> check_packet_pd_VND (15000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                           <div class="ribbon-wrapper">
                              <?php if (intval($packet['status']) === 0) {?>
                                 <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                              <?php } else { ?>
                                 <div class="ribbon-design red">Actived</div>
                              <?php }?>
                           </div>
                        <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">38400</span>
                                 <span class="deposite_time_text">VND</span>
                              </div>
                           </div>
                        
                           <div class="deposite_info">
                              <span>60 days: 46080 VND + 38400 VND</span>
                              <br/>
                              <span>Daily profit: 768 VND</span><br>
                              <span>
                                 Fee : 1152 VND
                              </span>
                              <br/>
                              <?php if (count($packet) === 0 ) {?>
                                 <form method="GET" class="packet-invest-VND" action="<?php echo $self->url->link('account/pd/pd_investment_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="0">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide-VND" action="<?php echo $self->url->link('account/pd/packet_invoide_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
                                 </form>
                              <?php } ?>
                              
                           </div>
                        </div>
                     </div>
                      
                      <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div class="deposite deposite_red">
                        <?php $packet = $self -> check_packet_pd_VND (15000000) ;?>
                        <?php if(count($packet) > 0) { ?>
                           <div class="ribbon-wrapper">
                              <?php if (intval($packet['status']) === 0) {?>
                                 <div class="ribbon-design red" style="background-color:#cecece">Watting</div>
                              <?php } else { ?>
                                 <div class="ribbon-design red">Actived</div>
                              <?php }?>
                           </div>
                        <?php }?>
                           <span class="deposite_title">60 days</span>
                           <div class="deposite_time_wrap">
                              <span class="deposite_time_wrap_text">2% Daily</span>
                              <div class="deposite_time">
                                 <span class="deposite_time_digit">76800</span>
                                 <span class="deposite_time_text">VND</span>
                              </div>
                           </div>
                        
                           <div class="deposite_info">
                              <span>60 days: 92160 VND + 76800 VND</span>
                              <br/>
                              <span>Daily profit: 1536 VND</span><br>
                              <span>
                                 Fee : 2304 VND
                              </span>
                              <br/>
                              <?php if (count($packet) === 0 ) {?>
                                 <form method="GET" class="packet-invest-VND" action="<?php echo $self->url->link('account/pd/pd_investment_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="0">
                                    <button class="btn btn-default">Upgrade Now</button>
                                 </form>
                              <?php } else {?>
                                 <form method="GET" class="packet-invoide-VND" action="<?php echo $self->url->link('account/pd/packet_invoide_VND', '', 'SSL'); ?>">
                                    <input type="hidden" name="invest" value="<?php echo $packet['pd_number'] ?>">
                                    <button class="btn btn-default">Reviews</button>
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
	    
    <!-- <div class="row rule" style="margin-top:0;">
        <div class="col-md-12" id="anouncenment">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        News
                    </h3>
                </div>
                <?php if($article_limit){?>
                <div class="panel-body" style="min-height:335px;">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <?php foreach ($article_limit as $key=> $value): ?>
                            <div class="blog-item">
                                <p class="blog-title">
                                    <a href="">
                                        <?php echo $value['article_title'] ?>
                                    </a>
                                </p>
                                <p>
                                    <?php echo date("m/d/Y H:i:A", strtotime($value['date_added'])); ?>
                                </p>
                                <p>
                                    <?php echo html_entity_decode($value['description']) ?>
                                </p>
                            </div>
                            <?php endforeach; ?>
                            <?php echo $pagination; ?> </div>
                    </div>
                </div>
                <?php } ?> 
            </div>
        </div>
    </div> -->
    

</div>
</div>
</section>
<script type="text/javascript">
    if (location.hash === '#success') {
        alertify.set('notifier', 'delay', 100000000);
        alertify.set('notifier', 'position', 'top-right');
        alertify.success('Create user successfull !!!');
    }
</script>
<?php echo $self->load->controller('common/footer') ?>