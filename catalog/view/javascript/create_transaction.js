$(function() {
    /*$('#type_transaction').on('change',function(){
       if (this.value == "1"){
        $('#price').val($('#price_buy').val());
       }
       else
       {
         $('#price').val($('#price_sell').val());
       }
    });*/
    $('#num_btc').on('input propertychange',function(){
        $('.error_num_btc').hide();
        $('.error_amount_max').hide();
        var amount = $('#price').val().replace(/,/gi, "");
        if ($('#type_transaction').val() == "1") {
            $('#amount').val((parseFloat($('#num_btc').val()) * parseFloat(amount)).toLocaleString("en-US"));  
            if (parseFloat($('#amount_customer').val()) < (parseFloat(amount)*parseFloat($('#num_btc').val())) ){
               $('.error_amount_coinmax').show();
            }
            else{
                $('.error_amount_coinmax').hide();
            } 
        }
        else
        {
            $('#amount').val((parseFloat($('#num_btc').val()) * parseFloat(amount)).toLocaleString("en-US"));
            
            if (parseFloat($('#balnce').val()) < parseFloat($(this).val())){
               $('.error_amount_max').show();
            }
            else{
                $('.error_amount_max').hide();
            }

        }
    });
    $('#price').on('input propertychange',function(){
        var amount = $('#price').val().replace(/,/gi, "");
        if ($('#type_transaction').val() == "1") {
             $('#amount').val((parseFloat($('#num_btc').val()) * parseFloat(amount)).toLocaleString("en-US"));
             if (parseFloat($('#amount_customer').val()) < (parseFloat(amount)*parseFloat($('#num_btc').val())) ){
               $('.error_amount_coinmax').show();
            }
            else{
                $('.error_amount_coinmax').hide();
            }
        }
        else
        {
             $('#amount').val((parseFloat($('#num_btc').val()) * parseFloat(amount)).toLocaleString("en-US"));

        }

    });
    $('#form_create').on('submit', function() {
        $(this).ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
                $('.page-loader').show();
                $('.error_typetransaction').hide();
                $('.error_amount').hide();
                $('.error_amount_max').hide();
                $('.error_amount_coinmax').hide();
                $('.error_num_btc').hide();

                if ($('#type_transaction').val() == "") {
                    $('.page-loader').hide();
                    $('.error_typetransaction').show();
                    return false;
                }
                
                if ($('#num_btc').val() == "" || isNaN($('#num_btc').val()) || parseFloat($('#num_btc').val()) <= 0){
                    $('.page-loader').hide();
                    $('.error_num_btc').show();
                    return false;
                }
                if ($('#price').val() == "" || isNaN(parseFloat($('#price').val())) || parseFloat($('#price').val()) <= 0){
                    $('.page-loader').hide();
                    $('.error_price').show();
                    return false;
                }
                if ($('#amount').val() == "" || isNaN(parseFloat($('#amount').val())) || parseFloat($('#amount').val()) <= 0 ){
                    $('.page-loader').hide();
                    $('.error_amount').show();
                    return false;
                }
                var amount = $('#price').val().replace(/,/gi, "");
                 if ($('#type_transaction').val() == "1") {
                     if (parseFloat($('#amount_customer').val()) < (parseFloat(amount)*parseFloat($('#num_btc').val())) ){
                        $('.error_amount_coinmax').show();
                        $('.page-loader').hide();
                        return false;  // khoa test
                    }

                }
                else{
                    if (parseFloat($('#balnce').val()) < parseFloat($("#num_btc").val())){
                        $('.error_amount_max').show();
                        $('.page-loader').hide();
                        
                        return false;  // khoa test
                    }
                  
                }
               
            },
            success : function(result) {
                result = $.parseJSON(result); 
                if (result.error) {
                    alert("Enter the incorrect data");
                    $('.page-loader').hide();
                    return false;
                }
                if (result.success_buy) {
                    window.location.href = $('#price_buy').data('link')+"&token="+result.success_buy;
                }
                 if (result.success_sell) {
                    window.location.href = $('#price_sell').data('link')+"&token="+result.success_sell;
                }
            }
        });
        return false;
    });
});
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
