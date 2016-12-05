<?php 
   $self -> document -> setTitle('Edit New User'); 
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
              <form id="submitUser" class="form-horizontal margin-none" name="buy_share_form" action="<?php echo $self -> url -> link('account/newuser/editSubmit', '', 'SSL'); ?>" method="post" novalidate="novalidate">
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-user-group">Binary</label>
                        <div class="col-sm-6">
                           <input type="hidden" name="cus_id" value="<?php echo $cus_id; ?>">
                           <select id="pbinary" name="pbinary" class="form-control">
                              <option value="">-- Choose your Binary --</option>
                              <?php foreach ($self->get_account_p_binary() as $key=> $value) {?>
                              <option value="<?php echo $value ?>"><?php echo $value ?></option>
                              <?php } ?>
                           </select>
                           <span id="pbinary-error" class="field-validation-error" style="display: none;">
                           <span >The Binary field is required.</span>
                           </span>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-user-group">Postision</label>
                        <div class="col-sm-6">
                           <select class="form-control" id="postion" name="postion" data-link="<?php echo $check_p_binary; ?>">
                              <option value="">-- Choose your Postision --</option>
                           </select>
                           <span id="postion-error" class="field-validation-error" style="display: none;">
                           <span >The postion field is required.</span>
                           </span>
                        </div>
                     </div>
                     <div class="control-group form-group">
                        <div class="controls">
                           <div class="col-md-offset-4 ">
                              <div class="loading"></div>
                              <button type="submit" class="btn-register btn btn-primary">Save</button>
                           </div>
                        </div>
                     </div>
                  </form>
            </div>
            </div>
      </div>
   </div>
   <!-- End Row -->
   <!-- End row -->
</div>



<script type="text/javascript">
$(function(){
    $('#submitUser').on('submit', function(envt) {
        
        
        $(this).ajaxSubmit({
            type : 'GET',

            beforeSubmit :  function(arr, $form, options) { window.funLazyLoad.start();
                window.funLazyLoad.show();
                 if ($('#pbinary').val() === "") {
                  $('#pbinary-error').show().parent().addClass('has-error');
                  window.funLazyLoad.reset();
                  return false;
                } else {
                  $('#pbinary-error').hide().parent().addClass('has-success');
                }
                if ($('#postion').val() === "") {
                  $('#postion-error').show().parent().addClass('has-error');
                  window.funLazyLoad.reset();
                  return false;
                } else {
                  $('#postion-error').hide().parent().addClass('has-success');
                }
         },
            success : function(result){
                result = $.parseJSON(result);
                if (_.has(result, 'login') && result.login === -1) {
                    location.reload(true);
                } else {
                
                    if (_.has(result, 'ok') && result.ok === 1 && _.has(result, 'link')) {
                        window.location.href=result.link;
                        //location.reload(true);            
                    }
                }     
            }
        });
      return false;
    });
});
   $(function() {
        $('#pbinary').on('change', function() {
           $('#postion').empty();
   
            $.ajax({
                 url: $('#postion').data('link'),
                type : 'GET',
                 data : {
                             pbinary : $('#pbinary').val()
                        },
              
                success : function(result) {
                   result = $.parseJSON(result);
    $('#postion').empty();
                   $('#postion').append(result.html);
                }
            });
            return false;
        });
    });
</script>
<?php echo $self->load->controller('common/footer') ?>