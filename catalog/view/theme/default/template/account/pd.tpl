<?php $self -> document -> setTitle("Invesment Detail"); echo $self -> load -> controller('common/header'); echo $self -> load -> controller('common/column_left'); ?>

<div class="main-content">
    <div class="page-header">
      <div class="header-left-panel">
          <!--  Title Page -->
          <h1 class="page-title">Investment</h1>
          <!--  Breadcrumb Section -->
      </div>
    </div>
    <div class="page-content container-fluid">
        <div class="main-dashboard">
            <div class="row">
      <div class="col-md-12">
      <?php if(count($pds) > 0){?> 
         <div class="panel panel-default">
            <div class="panel-body">
               <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12" id="no-more-tables">
                     <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                           <tr>
 							                <th>Code</th>
                              <th>Date Created</th>
                              <th>Packet</th>
                              <th>Profit</th>
                              <th>Time</th>
                           </tr>
                        </thead>
                        <tbody>
                           <?php foreach ($pds as $value=> $key){?> 
                           <tr>
        					<td data-title="Code">#<?php echo $key['pd_number'] ?></td>
                            <td data-title="Date Created"><?php echo date("Y-m-d H:i:A", strtotime($key['date_added'])); ?></td>
                              
                            <td data-title="Packet">
                              	<?php echo (doubleval($key['filled']) / 100000000) ?> BTC
                            </td>
                            <td data-title="Profit"> <?php echo (doubleval($key['max_profit']) / 100000000) ?> BTC</td>
                      
                            <td data-title="Time"> <span style="color:; font-size:15px;" class="text-warning countdown" data-countdown="<?php echo  $key['date_finish'] ?>"> </span> </td>
                           </tr>
                           <?php }?> 
                        </tbody>
                     </table>
                  </div>
               </div>
              
               
            </div>
         </div>
         <?php } ?>

         </div>
          <h3 style="margin-top: 30px; float: left;width: 100%" class="text-center">List Investment</h3>    

                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                    <div class="bg-white widget widgett-shadow">
                        <?php $packet = $self -> check_packet_pd (50000000) ;?>
                        <?php $class = "";if(count($packet) > 0) if (intval($packet['status']) === 1) $class = "active";?>
                        <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                            <div class="card-action">
                                <span class="sparkline-bar2">0.5 BTC</span>
                            </div>
                            <div class="widget-font-20 clearfix text-center">
                                90 Days
                            </div>
                            <div class="widget-font-20 clearfix text-center">
                                2% Daily
                            </div>
                        </div>
                        <div class="widgets-top-padding padding-30 padding-bottom-10">
                            <div class="row no-space">
                                <div class="col-xs-12 text-center">
                                    <p><span class="icon md-circle circle-success"></span>90 Days: 0.9 BTC + 0.5 BTC</p>
                                    <p class="margin-bottom-10">
                                        <span class="icon md-circle circle-blue"></span>Daily profit: 0.01 BTC
                                    </p>
                                </div>
                                
                                <div class="card-action">
                                    <?php if (count($packet) === 0) {?>
                                    <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                        <input type="hidden" name="invest" value="50000000">
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
                            <?php $packet = $self -> check_packet_pd (100000000) ;?>
                        <?php $class = ""; if(count($packet) > 0) if (intval($packet['status']) === 1) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">1 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    90 Days
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    2.1% Daily
                                </div>
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>90 Days: 1.89 BTC +1 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.021 BTC
                                        </p>
                                        
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="100000000">
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
                            <?php $packet = $self -> check_packet_pd (500000000) ;?>
                        <?php $class = "";if(count($packet) > 0) if (intval($packet['status']) === 1) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">5 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    90 Days
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    2.2% Daily
                                </div>
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>90 Days: 9.9 BTC + 5 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.11 BTC
                                        </p>
                                        
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="500000000">
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
                            <?php $packet = $self -> check_packet_pd (1000000000) ;?>
                        <?php $class = "";if(count($packet) > 0) if (intval($packet['status']) === 1) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">10 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    90 Days
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    2.3% Daily
                                </div>
                                
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>90 Days: 20.07 BTC + 10 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.23 BTC
                                        </p>
                                       
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="1000000000">
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
                            <?php $packet = $self -> check_packet_pd (2000000000) ;?>
                        <?php $class = "";if(count($packet) > 0) if (intval($packet['status']) === 1) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">20 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    90 Days
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    2.4% Daily
                                </div>
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>90 Days: 43.2 BTC + 10 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 0.24 BTC
                                        </p>
                                       
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="2000000000">
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
                            <?php $packet = $self -> check_packet_pd (5000000000) ;?>
                        <?php $class = "";if(count($packet) > 0) if (intval($packet['status']) === 1) $class = "active";?>
                            <div class="bg-info white padding-30 padding-bottom-20 <?php echo $class ?>">
                                <div class="card-action">
                                    <span class="sparkline-bar2">50 BTC</span>
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    90 Days
                                </div>
                                <div class="widget-font-20 clearfix text-center">
                                    2.5% Daily
                                </div>
                            </div>
                            <div class="widgets-top-padding padding-30 padding-bottom-10">
                                <div class="row no-space">
                                    <div class="col-xs-12 text-center">
                                        <p><span class="icon md-circle circle-success"></span>90 Days: 112.5 BTC + 50 BTC </p>
                                        <p class="margin-bottom-10">
                                            <span class="icon md-circle circle-blue"></span>Daily profit: 1.25 BTC
                                        </p>
                                        
                                    </div>
                                    
                                    <div class="card-action">
                                        <?php if (count($packet) === 0) {?>
                                        <form method="GET" class="packet-invest" action="<?php echo $self->url->link('account/pd/pd_investment', '', 'SSL'); ?>">
                                            <input type="hidden" name="invest" value="5000000000">
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
</div><?php echo $self->load->controller('common/footer') ?>