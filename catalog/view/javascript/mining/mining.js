$(function() {
	$('#mining').on('submit', function() {
		if ($('#amount').val() == "")
		{
			$('#amount').css({'border':'1px solid red'});
			$('#amount').focus();
			return false;
		}
		if (parseFloat($('#amount').val()) > parseFloat($('#balance').val()))
		{

			$('#amount').css({'border':'1px solid red'});
			$('#amount').focus();
			return false;
		}
         alertify.confirm('<p class="text-center" style="font-size:25px !important;color: black;text-transform: uppercase;height: 20px">Do you agree to it?</p>', function (e) {
		
        if (e) {
            $('#mining').ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
               window.funLazyLoad.start();
            },
            success : function(result) {
            	window.funLazyLoad.reset();
                result = $.parseJSON(result); 
                if (result.error) {
                    alert("Enter the incorrect data");
                    return false;
                }
                if (result.succsess) {
                  var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: uppercase;height: 20px">Successful transfer!</p>';
                  
                  alertify.alert(html, function(){
                      location.reload(true); 
                  });
                }
            }
        });
            } else {
                // user clicked "cancel"
            }
        });
        
        return false;
    });


  $('#amount_sfccoin').on('input propertychange',function(){
    $('#amount_btc').val(parseFloat($('#amount_sfccoin').val())*0.0008);
  });
  $('#amount_token').on('input propertychange',function(){
    $('#amount_btc_token').val(parseFloat($('#amount_token').val())*0.000025);
  });

  /*$('#tranfer_cm_btc').on('submit', function() {
      var html = '<div class="col-md-12">';
      html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: uppercase;height: 20px">You do not have amount SFCCON!</p>';
      
      alertify.alert(html, function(){
      });
      return false;
         alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Are you sure ?</p>', function (e) {
        if (e) {
            $('#tranfer_cm_btc').ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
                
            },
            success : function(result) {
                window.funLazyLoad.reset();
                result = $.parseJSON(result); 
                
            }
        });
            } else {
                // user clicked "cancel"
            }
        });
        
        return false;
    });*/


  $('#tranfer_cm_btc').on('submit', function() {
         alertify.confirm('<p class="text-center" style="font-size:18px !important;color: black;text-transform: uppercase;height: 20px">confirm Transaction ?</p>', function (e) {
        if (e) {
            $('#tranfer_cm_btc').ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
                if ($('#amount_sfccoin').val() == "" || isNaN(parseFloat($('#amount_sfccoin').val())) || isNaN(parseFloat($('#amount_sfccoin').val())) < 0){
                    $('.error_amount_sfccoin').show();
                    $(this).focus();
                    return false;
                } 
                if ($('#amount_btc').val() == "" || isNaN(parseFloat($('#amount_btc').val()))){
                    $('.error_amount_btc').show();
                    return false;
                } 
                if ($('#password_transaction_btc').val() == ""){
                    $('.error_password_transaction_btc').show();
                    return false;
                } 
            },
            success : function(result) {
                result = $.parseJSON(result); 
                if (result.error) {
                    alert("Enter the incorrect data");
                    window.funLazyLoad.reset();
                    return false;
                }
                 if (result.password) {
                    $('.error_password_transaction_btc').html('Transaction password is wrong').show();
                    return false;
                }
                if (result.money_transfer) {
                   window.funLazyLoad.reset();
                    var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: uppercase;height: 20px">You do not have amount SFCCON!</p>';
                  
                  alertify.alert(html, function(){
                     
                  });
                  return false;

                }
                if (result.succsess) {
                   var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: uppercase;height: 20px">Successful transfer!</p>';
                  
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



  $('#tranfer_cm_btc_token').on('submit', function() {
      var html = '<div class="col-md-12">';
      html += '<p class="text-center" style="font-size:19px !important;color: black;text-transform: uppercase;height: 20px">You do not end investment package!</p>';
      
      alertify.alert(html, function(){
      });
      return false;
         alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Are you sure ?</p>', function (e) {
        if (e) {
            $('#tranfer_cm_btc').ajaxSubmit({
            type : 'POST',
            beforeSubmit : function(arr, $form, options) {
                
            },
            success : function(result) {
                window.funLazyLoad.reset();
                result = $.parseJSON(result); 
                
            }
        });
            } else {
                // user clicked "cancel"
            }
        });
        
        return false;
    });


});