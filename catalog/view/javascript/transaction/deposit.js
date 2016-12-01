
$( document ).ready(function() {
    var getname_vcb = function(number,url){

        setTimeout(function(){
            $.ajax({
             url : url,
             type : "POST",
             dateType:"json",
             async : false,
             data : {
                'number_vcb' : number
             },
             success : function (result){
                var json = JSON.parse(result);
                var name = json.account_name;
                if (name == null){
                  getname_vcb(number,url);
                }
                else{
                  if (name=="N/A"){
                    $('#account_holder').attr('placeholder', 'Bank account number does not exist');
                    $('#account_holder').parent().addClass('has-error');
                    $('#account_number').parent().addClass('has-error');
                    $('#withdraw  i.fa-fw').hide();
                  }
                  else
                  {
                    $('#account_holder').val(name);
                    $('label.blue').css({'color':'#468847'});
                    $('input.blue').css({'border':'1px solid #468847'});
                    $('#withdraw  i.fa-fw').hide();
                    $('#account_number').parent().addClass('has-success');
                    $('#account_holder').parent().addClass('has-success');
                    $('#account_holder').parent().removeClass('has-error');

                  }
                }
             }
           });
        }, 200)
      };

    $('input#account_number').on("input propertychang", function() {
     
        $('#account_number').parent().removeClass('has-error');
        $('#account_number').parent().removeClass('has-success');
        if (jQuery('#bank_name').val() == "Vietcombank"){
            $('#account_holder').attr('readonly', true);
            if($(this).val().length === 13){
                $('#withdraw  i.fa-fw').show();

               var number = $(this).val();
                    var url  = $(this).data('url') ;
                    getname_vcb(number, url);


            }else{
                $('#account_holder').parent().removeClass('has-success');
                $('#withdraw  i.fa-fw').hide();
                $('#account_holder').val('');
            }
        }
    });
    jQuery('#bank_name').change(function(){
        
        if (jQuery('#bank_name').val() == "Vietcombank"){
            $('#account_holder').attr('readonly', true);
        }
        else
        {
            $('#account_holder').attr('readonly', false);
        }
    });
  $('input#amount_deposit').on("input propertychang", function() {
      $('#price_deposit').val($(this).val());
  });
  $('#deposit').on('submit', function() {

      $(this).ajaxSubmit({
          type : 'POST',
          beforeSubmit : function(arr, $form, options) {
               $('.error_password_transaction_deal').hide();
               $('.error_password_transaction').hide();
               $('.error_amount_deposit').hide();
              $('.page-loader').show();
              if ($('#amount_deposit').val() == "" || isNaN(parseFloat($('#amount_deposit').val()))){
                  $('.error_amount_deposit').show();
                  $('.page-loader').hide();
                  $('#amount_deposit').focus();
                  return false;
              }
              
              if ($('#bank_name').val() == "null"){
                $('.error_bank_name').show();
                $('.page-loader').hide();
                return false;
              } 
              if ($('#password_transaction').val() == ""){
                $('.error_password_transaction').show();
                $('.page-loader').hide();
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
              if (result.password) {
                    $('.page-loader').hide();
                    $('.error_password_transaction_deal').show();
                    return false;
                }
              if (result.limit) {
                $('.page-loader').hide();
                $('.page-loader').hide();
                 
                  var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:23px;color: black;text-transform: uppercase;height: 20px">Unsuccessful! Please payment transaction before !</p>';
                  html += '</div>';
                  alertify.alert(html, function(){
                      
                  });
                  $('#amount_deposit').val("");
                  $('#price_deposit').val("");
              }
              if (result.success) {
                  $('.page-loader').hide();
                  var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Billing Information !</p>';
                  html += '<p style="margin-top:30px;font-size:16px"><b>Note: </b> Please transfer the money to your account with the words <b>#'+result.success.code_deposit+'</b></p>';
                  html += '<p  style="font-size:16px">Bank name: '+result.success.bank_name+'</p>';
                  html += '<p style="font-size:16px">Branch: '+result.success.branch_bank+'</p>';
                  html += '<p style="font-size:16px">Account name: '+result.success.account_holder+'</p>';
                  html += '<p style="font-size:16px">Account number: '+result.success.account_number+'</p>';
                  html += '<p style="font-size:16px">Amount VNĐ: '+result.success.price_deposit+'</p>';

                  html += '</div>';
                  alertify.alert(html, function(){
                       window.location.replace('history_deposit.php');
                  });
                  $('#amount_deposit').val("");
                  $('#price_deposit').val("");
                  $('.ajs-dialog').css({'max-width':'368px !important'});
              } 
          }
      });
      return false;
  });


  $('#amount_withdraw').on("input propertychang", function() {
    var amount = $('#amount_withdraw').val().replace(/,/gi, "");
    if (parseFloat($('#amount_withdraw').data('max')) < amount ){
      $('.error_amount_withdraw_max').show();
    }
    //$('#price_withdraw').val($('#amount_withdraw').val());
  });
  $('#withdraw').on('submit', function() {

      $(this).ajaxSubmit({
          type : 'POST',
          beforeSubmit : function(arr, $form, options) {
              $('.page-loader').show();
              $('.error_password_transaction_deal_w').hide();
               $('.error_password_transaction_w').hide();
               $('.error_amount_withdraw_max').hide();
               $('.error_account_number').hide();
               $('.error_account_holder').hide();
              if ($('#account_number').val() == "" ){
                  $('.error_account_number').show();
                  $('.page-loader').hide();
                  $('#account_number').focus();
                  return false;
              }
              if ($('#account_holder').val() == ""){
                  $('.error_account_holder').show();
                  $('.page-loader').hide();
                  $('#account_holder').focus();
                  return false;
              }
              if ($('#amount_withdraw').val() == "" || isNaN(parseFloat($('#amount_withdraw').val()))){
                  $('.error_amount_withdraw').show();
                  $('.page-loader').hide();
                  $('#amount_withdraw').focus();
                  return false;
              }
              var amount = $('#amount_withdraw').val().replace(/,/gi, "");
               if (parseFloat($('#amount_withdraw').data('max')) < amount ){
                $('.error_amount_withdraw_max').show();
                 $('.page-loader').hide();
                $('#amount_withdraw').focus();
                return false;
              }
              if ($('#password_transaction_w').val() == ""){
                  $('.error_password_transaction_w').show();
                  $('.page-loader').hide();
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
              if (result.password) {
                    $('.page-loader').hide();
                    $('.error_password_transaction_deal_w').show();
                    return false;
                }
              if (result.limit) {
                $('.page-loader').hide();
                $('.page-loader').hide();
                 
                  var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:23px;color: black;text-transform: uppercase;height: 20px">Your transaction number today has expired !</p>';
                  html += '</div>';
                  alertify.alert(html, function(){
                      
                  });
              }
              if (result.success) {
                  $('.page-loader').hide();
                 
                  var html = '<div class="col-md-12">';
                  html += '<p class="text-center" style="font-size:19px;color: black;text-transform: uppercase;height: 20px">You Please allow us to send money to you. Thank you!</p>';
                  
                  alertify.alert(html, function(){
                      window.location.replace('history_withdraw.php');
                  });
                  $('#account_number').val("");
                  $('#account_holder').val("");
                  $('#amount_withdraw').val("");
                  $('#price_withdraw').val("");
              } 
          }
      });
      return false;
  });
  
})
function show_billing(amount,deposit_code){
    $.ajax({
        url : "index.php?route=cmpay/deposit/show_bill",
        type : "post",
        dataType:"text",
        data : {
           'deposit_code' : deposit_code  
        },
        success : function (result){
           result = $.parseJSON(result);
           var html = '<div class="col-md-12">';
            html += '<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Billing Information !</p>';
            html += '<p style="margin-top:30px;font-size:16px"><b>Note: </b> Please transfer the money to your account with the words <b>#'+result.success.deposit_code+'</b></p>';
            html += '<p  style="font-size:16px">Bank name: '+result.success.bank_name+'</p>';
            html += '<p style="font-size:16px">Branch: '+result.success.branch_bank+'</p>';
            html += '<p style="font-size:16px">Account name: '+result.success.account_holder+'</p>';
            html += '<p style="font-size:16px">Account number: '+result.success.account_number+'</p>';
            html += '<p style="font-size:16px">Amount VNĐ: '+result.success.price+'</p>';

            html += '</div>';
            alertify.alert(html, function(){
               
            });
        }
    });
  
    
}
function show_billing_withdarw(deposit_code){
    $.ajax({
        url : "index.php?route=cmpay/withdraw/show_bill_withdraw",
        type : "post",
        dataType:"text",
        data : {
           'deposit_code' : deposit_code  
        },
        success : function (result){
           result = $.parseJSON(result);
           var html = '<div class="col-md-12">';
            html += '<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 20px">Billing Information !</p>';
            html += '<p style="margin-top:30px;font-size:16px"><b>Note: </b> Please transfer the money to your account with the words <b>#'+result.success.withdraw_code+'</b></p>';
            html += '<p  style="font-size:16px">Bank name: '+result.success.bank_name+'</p>';
            html += '<p style="font-size:16px">Branch: '+result.success.branch_bank+'</p>';
            html += '<p style="font-size:16px">Account name: '+result.success.account_holder+'</p>';
            html += '<p style="font-size:16px">Account number: '+result.success.account_number+'</p>';
            html += '<p style="font-size:16px">Amount VNĐ: '+result.success.price+'</p>';

            html += '</div>';
            alertify.alert(html, function(){
               
            });
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
    $('#price_deposit').val(x);
}
function reformatText_whithdraw(input) {        
    var x = input.value;
    x = x.replace(/,/g, ""); // Strip out all commas
    x = x.reverse();
    x = x.replace(/.../g, function (e) {
        return e + ",";
    }); // Insert new commas
    x = x.reverse();
    x = x.replace(/^,/, ""); // Remove leading comma
    input.value = x;
    $('#price_withdraw').val(x);
}
function select_deposit(customer_id){

  if (customer_id != 0)
  {

  $('#user_deposit').val(customer_id);
  $.ajax({
      url : "index.php?route=transaction/deposit/get_bank_customer",
      type : "post",
      dateType:"text",
      data : {
           'customer_id' : customer_id
      },
      success : function (result){
          result = $.parseJSON(result); 
          var xhtml = "";
          $('#bank_name').html('');
          for (var i = 0; i < result.length; i++) {
            $('#bank_name').append($('<option>',
             {
                value: result[i].bank_name,
                text : result[i].bank_name 
            }));
          }
          
      }
  });
  $('#amount_deposit').val('');
  $('#password_transaction').val('');
  $('#amount_deposit').focus();
  }
  else{
    $('#bank_name').html('');
      $('#bank_name').append($('<option>',
       {
          value: "Vietcombank",
          text : "Vietcombank" 
      }));
      $('#bank_name').append($('<option>',
       {
          value: "Sacombank",
          text : "Sacombank" 
      }));
      $('#bank_name').append($('<option>',
       {
          value: "BIDV",
          text : "BIDV" 
      }));
      $('#bank_name').append($('<option>',
       {
          value: "Viettinbank",
          text : "Viettinbank" 
      }));
      $('#bank_name').append($('<option>',
       {
          value: "Agribank",
          text : "Agribank" 
      }));
      $('#user_deposit').val(0);
  }
}
function select_withdraw(customer_id){
  $('#user_withdraw').val(customer_id);
  $('#amount_withdraw').val('');
  $('#password_transaction_w').val('');
  $('#amount_withdraw').focus();
}

function readURL(input,deposit_code) {
   if (input.files && input.files[0]) {
       var reader = new FileReader();

       reader.onload = function (e) {
           $('.blah_'+deposit_code).attr('src', e.target.result).show();
           $('.file-upload_'+deposit_code).hide();
           $('.submit_avatar_'+deposit_code).show();
       }

       reader.readAsDataURL(input.files[0]);
   }else{
       $('.blah').hide();
   }
  }
$( document ).ready(function() {

  $(".images_upload .file").on('change' , function (env) {
   
   var deposit_code = $(this).data('images');
   var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];
   if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {

      
   }else{
       readURL(this,$(this).data('images'));
   }
  });
});
$(document).ready(function() {
    if (location.hash === '#money_no') {
        var html = '<div class="col-md-12">';
          html += '<p class="text-center" style="font-size:23px;color: red;text-transform: uppercase;height: 70px">You do not have to pay VND number. Please reload VND. Thank you !</p>';
          html += '<p style="margin-top:30px;font-size:16px"></p>';
          html += '</div>';
          alertify.alert(html, function(){
             
          });
    }
});
$(document).ready(function() {
    if (location.hash === '#complete') {
        var html = '<div class="col-md-12">';
          html += '<p class="text-center" style="font-size:23px;text-transform: uppercase;height: 50px">Successful transaction. Thank you !</p>';
          html += '<p style="margin-top:30px;font-size:16px"></p>';
          html += '</div>';
          alertify.alert(html, function(){
             
          });
    }
    select_bank_name($('#bank_name').val());
});
function select_bank_name(bank_name){
  $.ajax({
      url : "index.php?route=transaction/deposit/get_bank_customer_chose",
      type : "post",
      dateType:"text",
      data : {
           'bank_name' : bank_name
      },
      success : function (result){
          result = $.parseJSON(result); 
          $('#account_number').val(result.account_number);
          $('#account_holder').val(result.account_holder);
          $('#branch_bank').val(result.branch_bank);
      }
  });
}

function check_finish_deposit(id_deposit){
  $.ajax({
    url : "index.php?route=cmpay/deposit/check_finish_deposit",
    type : "post",
    dateType:"text",
    data : {
         id : id_deposit
    },
    success : function (result){
        result = $.parseJSON(result); 
        if (result.status_gd == 1){
          location.reload(true);
        }
    }
  });
}
function check_finish_withdraw(id_withdraw){
  $.ajax({
    url : "index.php?route=cmpay/withdraw/check_finish_withdraw",
    type : "post",
    dateType:"text",
    data : {
         id : id_withdraw
    },
    success : function (result){
        result = $.parseJSON(result); 
        if (result.status_pd == 1){
          location.reload(true);
        }
    }
  });
}