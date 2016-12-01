<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>Nâng cấp gói đầu tư</h1>

  </div>
</div>  
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">Nâng cấp gói đầu tư</h3>
    </div>
    <?php 
      if (isset($_SESSION['success'])){?>
      <div class="alert alert-success">
        <strong>Success!</strong> Nâng cấp thành công.
      </div>
    <?php } ?>
    <div class="panel-body">
      <form id="" action="<?php echo $action_upgrade; ?>" method="POST" role="form">
      <div class="col-md-6 col-md-push-3">
          <label for="">Username tài khoản</label>
          <input type="text" autocomplete="off" required="required" class="form-control" id="p_node" name="p_node" placeholder="ID đăng nhập">
          <input type="hidden" id="customer_id"  name="customer_id" value="" placeholder="">
          <ul id="suggesstion-box" class="list-group"></ul>
           <span id="p_node-error" class="field-validation-error">
          </span>
          <span></span>
          <br/>
          <label for="">Nhập số lượng nâng cấp</label>
          <input name="investment" type="number" class="form-control" required="required" >
          
        </div>
        <br/>
      <div class="col-md-6 col-md-offset-5">
         <div class="form-group">
            <button onclick="return confirm('Bạn chắc chắn muốn nâng cấp?');" style="margin-top: 15px;" type="submit" class="btn btn-primary">Nâng cấp</button>
          </div>
      </div>
      </form>
      
    </div>
  </div>
</div>

<script type="text/javascript">
     $(document).ready(function(){
        $("#p_node").keyup(function(){
            $.ajax({
            type: "POST",
            url: "<?php echo $getaccount;?>",
            data:'keyword='+$(this).val(),        
            success: function(data){
                $("#suggesstion-box").show();
                $("#suggesstion-box").html(data);
                $("#p_node").css("background","#FFF");            
            }
            });
        });
    }); 
    function selectU(val,customer_id) {
        $("#p_node").val(val);
        $('#customer_id').val(customer_id);
        $("#suggesstion-box").hide();
    }
</script>
<?php echo $footer; ?>
<style type="text/css" media="screen">
  ul#suggesstion-box li:hover {
    cursor: pointer;
    background-color: #E27225;
    color: #fff;
}
ul#suggesstion-box
{
    z-index: 99999;
    position: absolute;
    width: 95%;
}
</style>

