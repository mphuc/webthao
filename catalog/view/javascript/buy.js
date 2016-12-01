$(function() {
    $('#num_btc').on('input propertychange',function(){
        $('.error_amount').hide();
       if (parseFloat($(this).val()) > parseFloat($(this).data('amount')))
       {
        $('.error_amount_btc').show();
       }
       else{
         $('.error_amount_btc').hide();
         
       }
       $('#amount').val(parseFloat($('#num_btc').val())*parseFloat($('#price').val()));
      if (parseFloat($('#num_btc').val()) > parseFloat($('#num_btc').data('max')))
       {
        $('.error_amount_max').show();
       }
       else
       {
        $('.error_amount_max').hide();

       }
    });
    $('#form_buy').on('submit', function() {
        $(this).ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
                $('.error_amount_max').hide();
                $('.error_amount').hide();
                $('.error_amount_btc').hide();
                $('.page-loader').show();

                if ($('#num_btc').val() == "" || isNaN($('#num_btc').val()) || parseFloat($('#num_btc').val()) <= 0){
                    $('.error_num_btc').show();
                    $('.page-loader').hide();
                    return false;
                } 
                if (parseFloat($('#num_btc').val()) > parseFloat($('#num_btc').data('amount')))
                {
                    $('.error_amount_btc').show();
                    $('.page-loader').hide();
                    return false; // test
                }
                  if (parseFloat($('#num_btc').val()) > parseFloat($('#num_btc').data('max')))
                   {
                    $('.error_amount_max').show();
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
                    html += '<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">This transaction is another transaction !</p>';
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