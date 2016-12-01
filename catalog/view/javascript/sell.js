$(function() {
    $('#num_btc').on('input propertychange',function(){
        $('#amount').val(parseFloat($('#num_btc').val())*parseFloat($('#price').val()));
        $('.error_amount').hide();
       if (parseFloat($(this).val()) > parseFloat($(this).data('max')))
       {
        $('.error_amount_max').show();
       }
       else{
         $('.error_amount_max').hide();
         
       }
        if (parseFloat($('#amount').val()) > parseFloat($('#amount').data('amount')))
       {
        $('.error_amount_cm').show();
       }
       else
       {
        $('.error_amount_cm').hide();

       }
    });
    $('#form_buy').on('submit', function() {
        $(this).ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
                $('.error_amount_max').hide();
                $('.error_amount').hide();
                $('.page-loader').show();
                if ($('#num_btc').val() == "" || isNaN($('#num_btc').val()) || parseFloat($('#num_btc').val()) <= 0){
                    $('.error_amount').show();
                    $('.page-loader').hide();
                    return false;
                } 
                 if (parseFloat($('#num_btc').val()) > parseFloat($('#num_btc').data('max')))
                   {
                    $('.error_amount_max').show();
                    $('.page-loader').hide();
                    return false;
                }
                  if (parseFloat($('#amount').val()) > parseFloat($('#amount').data('amount')))
                   {
                    $('.error_amount_cm').show();
                    $('.page-loader').hide();
                    return false; // test
                }
            },
            success : function(result) {
                result = $.parseJSON(result); 
                if (result.error) {
                    alert("Enter the incorrect data");
                    $('.page-loader').hide();
                    return false;
                }
                if (result.transaction) {
                    $('.page-loader').hide();
                    $('.page-loader').hide();
                    var html = '<div class="col-md-12">';
                    html += '<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">THIS TRANSACTION HAS DEALS !</p>';
                    html += '<div style="margin-top:30px;"></div>';
                    html += '</div>';
                    alertify.alert(html, function(){
                        
                    });
                    return false;
                }
                if (result.url) {
                    window.location.href = result.url
                }
            }
        });
        return false;
    });
});