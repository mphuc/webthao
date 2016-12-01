<?php 
   $self -> document -> setTitle('NEWS'); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
   <div class="page-title">
      <h3 class="title">News</h3>
   </div>
<div class="wraper container-fluid" style="width:100%;float:left">
   
   <!-- Form-validation -->

   <div class="row rule" style="margin-top:0;">
        <div class="col-md-12" id="anouncenment">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Notification
                    </h3>
                </div>
              
                <div class="panel-body" style="min-height:335px;">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="blog-item">
                                <p class="blog-title">
                                    <a data-toggle="modal" href='#note-1'>Group Coinmax announcement 1:</a>
                                </p>
                                <p>
                                    24/10/2016 01:24 AM </p>
                                <p>
                                </p>
                                <p>Today we pay twice for today and tomorrow due to billing system upgrade in blockchain. All other service will be normally.</p>
                                
                                <p></p>
                                
                                <div class="modal fade" id="note-1">

                                  <div class="modal-dialog">
                                    <div class="ajs-header"><img src="catalog/view/theme/default/img/logo.png" alt="logo" style=" width:150px;"></div>
                                    <div class="modal-content">

                                      <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Group Coinmax announcement 1:</h4>
                                      </div>
                                      <div class="modal-body">
                                         <p>Today we pay twice for today and tomorrow due to billing system upgrade in blockchain. All other service will be normally.</p>
                                         <br>
                                         <p>Thanks and best regards.<br>

Coinmax team.!</p>
                                      </div>
                                      
                                    </div>
                                  </div>
                                </div>
                            </div> 
                            <div class="blog-item">
                                <p class="blog-title">
                                    <a data-toggle="modal" href='#note-2'>Group Coinmax announcement 2:</a>
                                </p>
                                <p>
                                    24/10/2016 08:24 AM</p>
                                <p>
                                </p>
                                <p>We are pleased to announce that the blockchain payment system has been upgraded successfully.
For those who received 2 payments today will also receive your payment tomorrow, as our bonus to the members for the supports.</p>
                                
                                <p></p>
                                <div class="modal fade" id="note-2">
                                  <div class="modal-dialog">
                                    <div class="ajs-header"><img src="catalog/view/theme/default/img/logo.png" alt="logo" style=" width:150px;"></div>
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Group Coinmax announcement 2:</h4>
                                      </div>
                                      <div class="modal-body">
                                         <p>We are pleased to announce that the blockchain payment system has been upgraded successfully.
For those who received 2 payments today will also receive your payment tomorrow, as our bonus to the members for the supports.</p>
                                         <br>
                                         <p>Thanks and best regards.<br>

Coinmax team.!</p>
                                      </div>
                                      
                                    </div>
                                  </div>
                                </div>
                            </div> 
                            <!-- blog3 -->
                            <div class="blog-item">
                                <p class="blog-title">
                                    <a data-toggle="modal" href='#note-3'>Group Coinmax announcement 3:</a>
                                </p>
                                <p>
                                    11/11/2016 01:00 AM</p>
                                <p>
                                </p>
                                <p>We are going to enter stage one  and implement the very first functionalities for the community :</p>
                                
                                <p></p>
                                <div class="modal fade" id="note-3">
                                  <div class="modal-dialog">
                                    <div class="ajs-header"><img src="catalog/view/theme/default/img/logo.png" alt="logo" style=" width:150px;"></div>
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Group Coinmax announcement 3:</h4>
                                      </div>
                                      <div class="modal-body">
                                         <p>We are going to enter stage one  and implement the very first functionalities for the community : Coinmax Pay and Coinmax Exchange. Please update your information in the new form located in the 'profile' session. <br>
All inquiries, questions please contact us via support@coinmax.biz
</p>
                                         <br>
                                         <p>Sincerely yours.<br>

Coinmax team.!</p>
                                      </div>
                                      
                                    </div>
                                  </div>
                                </div>
                            </div> 
                            <!-- end blog 3 -->
                          </div>
                    </div>
                </div>
              
            </div>
        </div>
    </div> 
   <!-- End Row -->
   <!-- End row -->
</div>
<?php echo $self->load->controller('common/footer') ?>