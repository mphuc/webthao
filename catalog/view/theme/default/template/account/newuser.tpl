<?php 
   $self -> document -> setTitle('New User'); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
    <div class="main-content">
   <div class="page-header">
      <div class="header-left-panel">
          <!--  Title Page -->
          <h1 class="page-title">New user</h1>
          <!--  Breadcrumb Section -->
      </div>
    </div>     
    <div class="page-content container-fluid">
        <div class="main-dashboard">
     
            <div class="row">
      <div class="col-md-12">

                <?php if(count($user) > 0){ ?>
         <div class="card">
            <div class="card-body table-responsive" id="no-more-tables">
                  <table id="datatable" class="table table-striped table-bordered">
                     <thead>
                        <tr>
                          <th class="text-center">No</th>
                          <th>Username</th>
                        
                          <th>Email</th>
                          <th>Phone number</th>
                          <th>Wallet</th>
                           <th>Date Join</th>
                          <th>Action</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php $number = 1; foreach ($user as $key => $value) {?>
                            <tr>
                                 <td data-title="NO" align="center"><?php echo $number ?></td>
                                <td data-title="Username"><?php echo $value['username'] ?></td>
                              
                                 <td data-title="Email"><?php echo $value['email'] ?></td>
                                 <td data-title="Phone Number"><?php echo $value['telephone'] ?></td>
                                <td data-title="Wallet"><?php echo $value['wallet'] ?></td>
                                <td data-title="Date Join"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                                
                                <td data-title="Action">
                                    <a href="user-edit?id=<?php echo $value['customer_code'] ?>" class="btn btn-info ">Edit</a>
                                </td>
                            </tr>
                        <?php $number++; } ?>
                     </tbody>
                  </table>
               </div>
         </div>
         <?php } ?>
               </div>
            </div>
      </div>
   </div>
   <!-- End Row -->
   <!-- End row -->
</div>



   

<?php echo $self->load->controller('common/footer') ?>