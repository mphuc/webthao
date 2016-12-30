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

});