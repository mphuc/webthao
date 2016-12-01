$(function() {
    $('#username').on('input propertychange',function(){
        $('.wallet_tranfer').hide();
        $('.error_username').hide();
        $.ajax({
        type: "POST",
        url: $(this).data('link'),
        data:'keyword='+$(this).val(),        
        success: function(data){
            $("#suggesstion-box_username").show();
            $("#suggesstion-box_username").html(data);
            $("#p_node").css("background","#FFF");            
        }
        });
    });
    
    $('#amount').on('input propertychange',function(){
        var amount = $('#amount').val().replace(/,/gi, "");
       if (amount > parseFloat($(this).data('maxamount')))
       {
        $('.error_amount_max').show();
       }
       else{
         $('.error_amount_max').hide();
        
       }
    });
   
   
    $('#tranfer_cm').on('submit', function() {
         alertify.confirm('<p class="text-center" style="font-size:25px !important;color: black;text-transform: uppercase;height: 20px">Do you agree to it?</p>', function (e) {
        if (e) {
            $('#tranfer_cm').ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
               var amount = $('#amount').val().replace(/,/gi, "");
                $('.error_amount').hide();
                 $('.error_amount_max').hide();
                 $('.error_username').hide();
                 $('.error_password_transaction_vnd').hide();
                $('.page-loader').show();
                if ($('#username').val() == "" ){
                    $('.error_username').show();
                    $('.page-loader').hide();
                    $(this).focus();
                    return false;
                } 

                if ($('#amount').val() == "" || isNaN(parseFloat($('#amount').val())) || parseFloat($('#amount').val()) <1){
                    $('.error_amount').show();
                    $('.page-loader').hide();
                    return false;
                } 
                if (amount > parseFloat($('#amount').data('maxamount'))){
                    $('.error_amount_max').show();
                    $('.page-loader').hide();
                    $(this).focus();
                    return false;
                }
                if ($('#password_transaction_vnd').val() == ""){
                    $('.error_password_transaction_vnd').show();
                    $('.page-loader').hide();
                    return false;
                } 
                
                $('.page-loader').hide();
                

            },
            success : function(result) {
                result = $.parseJSON(result); 
                if (result.error) {
                    alert("Enter the incorrect data");
                    $('.page-loader').hide();
                    return false;
                }
                 if (result.password) {
                    $('.page-loader').hide();
                    $('.error_password_transaction_deal_vnd').show();
                    return false;
                }
                if (result.succsess) {
                   var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: uppercase;height: 20px">CM successful transfer!</p>';
                  
                  alertify.alert(html, function(){
                      location.reload(true); 
                  });


                }
                $('#username').val('');
                $('#amount').val('');
            }
        });
            } else {
                // user clicked "cancel"
            }
        });
        
        return false;
    });
       $('#tranfer_cm_btc').on('submit', function() {
         alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Are you sure ?</p>', function (e) {
        if (e) {
            $('#tranfer_cm_btc').ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
                $('.error_amount_btc').hide();
                $('.error_amount_max_btc').hide();
                $('.error_password_transaction_btc').hide();
                $('.page-loader').show();
                if ($('#amount_btc').val() == "" || isNaN(parseFloat($('#amount_btc').val())) || parseFloat($('#amount_btc').val()) <= 0 ){
                    $('.error_amount_btc').show();
                    $('.page-loader').hide();
                    return false;
                } 
                if ($('#amount_btc').val() > parseFloat($('#amount_btc').data('maxamount_btc'))){
                    $('.error_amount_max_btc').show();
                    $('.page-loader').hide();
                    return false;
                } 
                if ($('#password_transaction_btc').val() == ""){
                    $('.error_password_transaction_btc').show();
                    $('.page-loader').hide();
                    return false;
                } 
            },
            success : function(result) {
                $('.page-loader').hide();
                result = $.parseJSON(result); 
                if (result.error) {
                    alert("Enter the incorrect data");
                    $('.page-loader').hide();
                    return false;
                }
                 if (result.password) {
                    $('.page-loader').hide();
                    $('.error_password_transaction_deal_btc').show();
                    return false;
                }
                if (result.succsess) {
                   var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:19px;color: black;text-transform: uppercase;height: 20px">CM successful transfer!</p>';
                  
                  alertify.alert(html, function(){
                      location.reload(true); 
                  });


                }
                $('#username').val('');
                $('#amount').val('');
            }
        });
            } else {
                // user clicked "cancel"
            }
        });
        
        return false;
    });
});
function selectU(val) {
    $('.wallet_tranfer').show();
    $('#username').val(val);
    $('#suggesstion-box_username').hide();
    $.ajax({
        type: "POST",
        url: 'index.php?route=transaction/tranfercm/load_wallet_coinmax',
        data:{'username' : val},        
        success: function(data){
           result = $.parseJSON(data); 
           result = JSON.parse(result);
           $('#wallet_your').html(result.username);   
           $('#amount_your').html(numberWithCommas(result.amount));  
           $('.hidden_wallet').show(); 
           $('#amount').val('');
           $('#password_transaction_vnd').val('');
           $('#amount').focus();
        }
    });

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
function numberWithCommas(x) {
    x = x.toString();
    var pattern = /(-?\d+)(\d{3})/;
    while (pattern.test(x))
        x = x.replace(pattern, "$1,$2");
    return x;
}
