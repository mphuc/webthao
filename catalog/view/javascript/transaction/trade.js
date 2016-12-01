
function delete_sell(pd_number){
    alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Are you sure ?</p>',
        function(){
            window.location.replace('index.php?route=transaction/trade/delete_buy&token='+pd_number);
    });
   /* var html = '<div class="col-md-12">';
    html += '<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Are you sure ?</p>';
    alertify.alert(html, function(){
        window.location.replace('index.php?route=transaction/trade/delete_buy&token='+pd_number);
    });*/
}
function delete_buy(gd_number){
    alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Are you sure ?</p>',
        function(){
            window.location.replace('index.php?route=transaction/trade/delete_sell&token='+gd_number);
    });
   /* var html = '<div class="col-md-12">';
    html += '<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Are you sure ?</p>';
    alertify.alert(html, function(){
        window.location.replace('index.php?route=transaction/trade/delete_sell&token='+gd_number);
    });*/
}
    
$(document).ready(function() {
    if (location.hash === '#timeover') {
        var html = '<div class="col-md-12">';
          html += '<p class="text-center" style="font-size:24px;color: red;text-transform: uppercase;height: 20px">Timeout transactions !</p>';
          html += '<p style="margin-top:30px;font-size:16px"></p>';
          html += '</div>';
          alertify.alert(html, function(){
             
          });
    }
});
$(document).ready(function() {
    if (location.hash === '#error_pd') {
        var html = '<div class="col-md-12">';
          html += '<p class="text-center" style="font-size:23px;color: red;text-transform: uppercase;height: 20px">Transaction failed. You do not have to pay the BTC. Please perform other transactions. Thank you !</p>';
          html += '<p style="margin-top:30px;font-size:16px"></p>';
          html += '</div>';
          alertify.alert(html, function(){
             window.location.replace('index.php?route=transaction/dashboard');
          });
    }
});
$(document).ready(function() {
    if (location.hash === '#error_gd') {
        var html = '<div class="col-md-12">';
          html += '<p class="text-center" style="font-size:23px;color: red;text-transform: uppercase;height: 20px">Transaction failed. Players are not enough to pay the VNĐ. Please perform other transactions. Thank you !</p>';
          html += '<p style="margin-top:30px;font-size:16px"></p>';
          html += '</div>';
          alertify.alert(html, function(){
             window.location.replace('index.php?route=transaction/dashboard');
          });
    }
});
$(document).ready(function() {
    if (location.hash === '#error_ppd') {
        var html = '<div class="col-md-12">';
          html += '<p class="text-center" style="font-size:23px;color: red;text-transform: uppercase;height: 20px">Transaction failed. Players are not enough to pay for your BTC. Please perform other transactions. Thank you !</p>';
          html += '<p style="margin-top:30px;font-size:16px"></p>';
          html += '</div>';
          alertify.alert(html, function(){
             window.location.replace('index.php?route=transaction/dashboard');
          });
    }
});
$(document).ready(function() {
    if (location.hash === '#error_ggd') {
        var html = '<div class="col-md-12">';
          html += '<p class="text-center" style="font-size:23px;color: red;text-transform: uppercase;height: 20px">Transaction failed. You do not have to pay the amount of VNĐ. Please perform other transactions. Thank you !</p>';
          html += '<p style="margin-top:30px;font-size:16px"></p>';
          html += '</div>';
          alertify.alert(html, function(){
             window.location.replace('index.php?route=transaction/dashboard');
          });
    }
});