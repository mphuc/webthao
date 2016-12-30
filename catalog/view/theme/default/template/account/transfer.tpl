<?php 
   $self -> document -> setTitle('Mining'); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="main-content">
    <div class="page-header">
      <div class="header-left-panel">
          <!--  Title Page -->
          <h1 class="page-title">Transaction</h1>
          <!--  Breadcrumb Section -->
      </div>
    </div>
    <div class="page-content container-fluid">
        <div class="main-dashboard">
   <div class="row rule" style="margin-top:0;">
        <div class="col-md-12" id="anouncenment">
            <div class="panel panel-default">
                <div class="panel-heading">
                    
                </div>
              
                <div class="panel-body mining" style="min-height:335px;">
                    <div class="row">
                        <div class="nav-tabs-horyzontal nav-tabs-inverse border-top" style="margin-top: 40px;">
                           <ul class="nav  nav-tabs nav-top-line hover-none" role="tablist">
                              <li class="nav-item active">
                                 <a class="nav-link " data-toggle="tab" href="#home11" role="tab" aria-expanded="true">Withdraw BTC</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link " data-toggle="tab" href="#profile11" role="tab" aria-expanded="false">Buy Token</a>
                              </li>
                              
                           </ul>
                           <div class="tab-content ">
                              <div class="tab-pane active" id="home11" role="tabpanel">
                                <h3>You do not have enough Sfc coin</h3>
                                <br>
                                <p>1 Sfc coin = 0.000025 BTC</p>
                              </div>
                              <div class="tab-pane" id="profile11" role="tabpanel">
                                 <h3>You do not finish investment package.</h3>
                                 <br>
                                 <p>1 Token = 0.000025 BTC</p>
                              </div>
                              
                           </div>
                        </div>
                    </div>
                </div>
              
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