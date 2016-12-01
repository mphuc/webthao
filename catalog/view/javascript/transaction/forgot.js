$(function(){
	$('form').on('submit', function(){
		window.funLazyLoad.start();
		return true;
	});
	
   
	$('#input-email').on("input propertychang", function() {
	      load_question($(this).val());
	   
		
	});
});

function load_question(username){
	$.ajax({
        url : "index.php?route=transaction/forgotten/getSecret_question",
        type : "post",
        dateType:"text",
        data : {
             'username' : username
        },
        success : function (result){
        	result = $.parseJSON(result); 
        	$('.secret_question').html(result.question)
            console.log(result);
        }
    });
}