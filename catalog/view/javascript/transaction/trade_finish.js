
function trade_finish(transfer_code) {
    $.ajax({
        url : "index.php?route=transaction/buy/check_finish_trade",
        type : "post",
        dateType:"text",
        data : {
             'token' : transfer_code
        },
        success : function (result){
             result = $.parseJSON(result); 
             if (result.complete == -1){
                setTimeout(function(){ trade_finish(transfer_code);; }, 3000);
             }
             if (result.complete == 1){
                var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Successful transaction !</p>';
                  html += '</div>';
                  alertify.alert(html, function(){
                      location.reload(true);
                  });

             }
        }
    });
}