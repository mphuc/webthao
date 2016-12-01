
function edit_gd(gd_number){
    var html = '<div class="col-md-12">';
        html += '<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Edit Info purchases !</p>';
        html += '<form id="edit_gd" style="margin-top:30px" method="POST" action="index.php?route=transaction/dashboard/update_gd" autocomplete="off">';
        html += '<div class="col-md-6 form-group"><input type="hidden" name="token" value="'+gd_number+'">';
        html += '<label for="pwd">Amount BTC</label>';
        html += '<input type="text" placeholder="Amount BTC" name="amountbtc" id="amountbtc"  class="form-control">';
        html += '<label for="pwd">Price</label>';
        html += '<input type="text" name="price" onkeyup="reformatText(this)" id="price" placeholder="Price" class="form-control">';
        html += '</div>';
        html += '<div class="col-md-6 form-group">';
       
        html += '<label for="pwd">Amount VNĐ</label>';
        html += '<input type="text" name="amountcm" readonly="true" id="amountcm" placeholder="Amount VNĐ" class="form-control">';
        html += '<label for="pwd"></label>';
        html += '<span class="error error_no_bct">You do not have sufficient number of VNĐ</span>'
        html += '<input type="submit" style="width:100%" class="btn btn-default" value="OK">';
        html += '</div>';
        html += '</form>';
        html += '</div>';
        alertify.alert(html, function(){
            
        });
        $('.ajs-btn.ajs-ok').html('Cancel');
        $('.ajs-btn.ajs-ok').css({'margin-right':'40px'});
        $('#price').on('input propertychange',function(){
            var amount = $('#price').val().replace(/,/gi, "");
            $('#amountcm').val((parseFloat(amount)*parseFloat($('#amountbtc').val())).toLocaleString("en-US"));
        });
         $('#amountbtc').on('input propertychange',function(){
            var amount = $('#price').val().replace(/,/gi, "");
            $('#amountcm').val((parseFloat(amount)*parseFloat($('#amountbtc').val())).toLocaleString("en-US"));
        });
        $('#edit_gd').on('submit', function() {
            $(this).ajaxSubmit({
                type : 'POST',
                beforeSubmit : function(arr, $form, options) {
                    $('.page-loader').show();
                    $('#amountcm').css({'border':'1px solid #ccc'});
                    $('#price').css({'border':'1px solid #ccc'});
                    if ($('#amountbtc').val() == "" || $('#amountbtc').val() < 0.01 ){
                        $('#amountbtc').css({'border':'1px solid red'});
                        
                        $('.page-loader').hide();
                        $('#amountbtc').focus();
                        return false;
                    }
                    if ($('#price').val() == ""){
                        $('#price').css({'border':'1px solid red'});
                        $('.page-loader').hide();
                        $('#price').focus();
                        return false;
                    }
                    if ($('#amountcm').val() == ""){
                        $('#amountcm').css({'border':'1px solid red'});
                        $('.page-loader').hide();
                        $('#amountcm').focus();
                        return false;
                    }
                    
                    
                },
                 success : function(result) {
                    result = $.parseJSON(result); 
                    if (result.error) {
                        alert("Enter the incorrect data");
                        $('.page-loader').hide();
                        return false;
                    }
                    if (result.btc) {
                        $('.error_no_bct').show();
                        $('.page-loader').hide();
                        return false;
                    }
                    if (result.complate) {
                         location.reload(true);
                    }

                }
            });
            return false;
        });
    return false;
}
   
function edit_pd(gd_number){

    var html = '<div class="col-md-12">';
        html += '<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Edit Info sales !</p>';
        html += '<form id="edit_pd" style="margin-top:30px" method="POST" action="index.php?route=transaction/dashboard/update_pd" autocomplete="off">';
        html += '<div class="col-md-6 form-group"><input type="hidden" name="token" value="'+gd_number+'">';
        html += '<label for="pwd">Amount BTC</label>';
        html += '<input type="text" placeholder="Amount BTC" name="amountbtc" id="amountbtc" class="form-control">';
        html += '<label for="pwd">Price</label>';
        html += '<input type="text" name="price" onkeyup="reformatText(this)" id="price" placeholder="Price" class="form-control">';
        html += '</div>';
        html += '<div class="col-md-6 form-group">';
        
        html += '<label for="pwd">Amount VNĐ</label>';
        html += '<input type="text" name="amountcm" readonly="true"  id="amountcm" placeholder="Amount VNĐ" class="form-control">';
        html += '<label for="pwd"></label>';
        html += '<span class="error error_no_bct">You do not have sufficient number of BTC</span>'
        html += '<input type="submit" style="width:100%" class="btn btn-default" value="OK">';
        html += '</div>';
        html += '</form>';
        html += '</div>';
        alertify.alert(html, function(){
            
        });
        $('.ajs-btn.ajs-ok').html('Cancel');
        $('.ajs-btn.ajs-ok').css({'margin-right':'40px'});

        $('#price').on('input propertychange',function(){
            var amount = $('#price').val().replace(/,/gi, "");
            $('#amountcm').val((parseFloat(amount)*parseFloat($('#amountbtc').val())).toLocaleString("en-US"));
        });
        $('#amountbtc').on('input propertychange',function(){
            $('#amountcm').val((parseFloat(amount)*parseFloat($('#amountbtc').val())).toLocaleString("en-US"));
        });
        $('#edit_pd').on('submit', function() {
            $(this).ajaxSubmit({
                type : 'POST',
                beforeSubmit : function(arr, $form, options) {
                    $('.page-loader').show();
                    $('#amountcm').css({'border':'1px solid #ccc'});
                    $('#price').css({'border':'1px solid #ccc'});
                    if ($('#amountbtc').val() == "" || $('#amountbtc').val() < 0.01 ){
                        $('#amountbtc').css({'border':'1px solid red'});
                        
                        $('.page-loader').hide();
                        $('#price').focus();
                        return false;
                    }
                    if ($('#price').val() == ""){
                        $('#price').css({'border':'1px solid red'});
                        $('.page-loader').hide();
                        $('#price').focus();
                        return false;
                    } 
                    if ($('#amountcm').val() == ""){
                        $('#amountcm').css({'border':'1px solid red'});
                        $('.page-loader').hide();
                        $('#amountcm').focus();
                        return false;
                    }
                    
                    
                },
                 success : function(result) {
                    result = $.parseJSON(result); 
                    if (result.error) {
                        alert("Enter the incorrect data");
                        $('.page-loader').hide();
                        return false;
                    }
                    if (result.btc) {
                        $('.error_no_bct').show();
                        $('.page-loader').hide();
                        return false;
                    }
                    if (result.complate) {
                         location.reload(true);
                    }

                }
            });
            return false;
        });


    return false;
}
  String.prototype.reverse = function () {
      return this.split("").reverse().join("");
  }
  function reformatText(input) {   
      var x = input.value;
      x = x.replace(/,/g, ""); // Strip out all commas
      x = x.reverse();
      x = x.replace(/.../g, function (e) {
          return e + ",";
      }); // Insert new commas
      x = x.reverse();
      x = x.replace(/^,/, ""); // Remove leading comma
      input.value = x;
  }

$(document).ready(function(){
    $('.content_chat').animate({scrollTop: document.body.scrollHeight},"fast");
   /* setInterval(function(){  append_message();
    $('.content_chat').animate({scrollTop: document.body.scrollHeight},"fast");
   }, 3000);*/
   $('#send_message').on('submit', function() {
        $(this).ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
               if ($('#message').val() == ""){
                $('#message').css({'border-bottom':'1px solid red'});
                return false;
               }
            },
             success : function(result) {
               result = $.parseJSON(result); 
               result = $.parseJSON(result.message); 
               console.log(result);
               if (result.img_profile == ""){
                var img = "catalog/view/theme/default/style1/img/team/1.jpg";
               }
               else{
                 var img = result.img_profile;
               }
               var date_adde = result.date_added.split(" ");
               xhtml = '<div class="item_chat">';
               xhtml += '<div class="left">';
               xhtml += '<img src="'+img+'">';
               xhtml += '</div><div class="center">';
               xhtml += '<h6 class="you">'+result.username+'</h6>';
               xhtml += '<p>'+result.message+'</p></div><div class="right">'+date_adde['1']+'</div>';
               xhtml += '</div><div class="clearfix"></div></div>';
               
               $('.content_chat').append(xhtml);
               $('.content_chat').animate({scrollTop: document.body.scrollHeight},"fast");
               $('#message').val("");
            }
        });
        return false;
    });

    append_message();

})

function append_message(){

     $.ajax({
        url : "index.php?route=transaction/dashboard/show_massage",
        type : "post",
        dateType:"text",
        data : {
             
        },
        success : function (result){
            
            result = $.parseJSON(result); 
            //console.log(result);
            var xhtml = "";
          $.each(JSON.parse(result), function(idx, obj) {
                if (obj.img_profile == ""){
                var img = "catalog/view/theme/default/style1/img/team/1.jpg";
               }
               else{
                 var img = obj.img_profile;
               }
               var date_adde = obj.date_added.split(" ");
              
               xhtml += '<div class="item_chat">';
               xhtml += '<div class="left">';
               xhtml += '<img src="'+img+'">';
               xhtml += '</div><div class="center">';
               xhtml += '<h6 class="you">'+obj.username+'</h6>';
               xhtml += '<p>'+obj.message+'</p></div><div class="right">'+date_adde['1']+'</div>';
               xhtml += '</div><div class="clearfix"></div></div>';
            });
          
          $('#conversation').append(xhtml);
         $('#conversation').animate({scrollTop: document.body.scrollHeight},"fast");
        }
    });
}
