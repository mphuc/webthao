<?php 
   $self -> document -> setTitle('NEWS'); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="main-content">
    <div class="page-header">
      <div class="header-left-panel">
          <!--  Title Page -->
          <h1 class="page-title">News</h1>
          <!--  Breadcrumb Section -->
      </div>
    </div>
    <div class="page-content container-fluid">
        <div class="main-dashboard">
   <div class="row rule" style="margin-top:0;">
        <div class="col-md-12" id="anouncenment">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Updating...
                    </h3>
                </div>
              
                <div class="panel-body" style="min-height:335px;">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                         
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