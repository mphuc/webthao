<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
   <div class="main-content">
   <div class="page-header">
      <div class="header-left-panel">
          <!--  Title Page -->
          <h1 class="page-title">Refferals</h1>
          <!--  Breadcrumb Section -->
      </div>
    </div>     
    <div class="page-content container-fluid">
        <div class="main-dashboard">
            <div class="row">
      <div class="col-md-12">

                  <div id="no-more-tables">
                     <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                           <tr>
                              <th class="text-center">No.</th>
                              <th>Username</th>
                              <!-- <th>Level</th> -->
                              <th>QR Code</th>
                              <th>Phone</th>
                              <th>Email</th>
                              <th>Country</th>
                              <!-- <th>Date Create</th> -->
                           </tr>
                        </thead>
                        <tbody>
                           <?php $count = 1; foreach ($refferals as $key => $value) { ?>
                           <tr>
                              <td data-title="<?php echo $lang['NO'] ?>." align="center"><?php echo $count ?></td>
                              <td data-title="<?php echo $lang['USERNAME'] ?>"><?php echo $value['username'] ?></td>
                              <!-- <td data-title="LEVEL">
                                 <?php echo "L".(intval($value['level']) - 1) ?>
                              </td> -->
                              <td data-title="<?php echo $lang['WALLET'] ?>" >
                                 
                                 <img src="https://chart.googleapis.com/chart?chs=75x75&chld=L|0&cht=qr&chl=bitcoin:<?php echo $value['wallet']; ?>">
                                 
                              </td>
                              <td data-title="<?php echo $lang['TELEPHONE'] ?>" >
                                 <?php echo $value['telephone']; ?>
                              </td>
                              <td data-title="<?php echo $lang['EMAIL'] ?>"><?php echo $value['email'] ?></td>
                              <td data-title="<?php echo $lang['COUNTRY'] ?>"><?php echo $self->getCountry($value['country_id']); ?></td>
                             <!--  <td data-title="DATE CREATED"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td> -->
                           </tr>
                           <?php $count++; } ?>
                        </tbody>
                     </table>
                     <?php echo $pagination; ?>
                  </div>
               </div>
            </div>
      </div>
   </div>
   <!-- End Row -->
   <!-- End row -->
</div>
<?php echo $self->load->controller('common/footer') ?>