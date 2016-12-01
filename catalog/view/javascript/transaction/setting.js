$( document ).ready(function() {
function readURL(input) {
   if (input.files && input.files[0]) {
       var reader = new FileReader();

       reader.onload = function (e) {
           $('#blah').attr('src', e.target.result).show();
           $('.img1').hide();
           $('#submit_avatar').show();
       }

       reader.readAsDataURL(input.files[0]);
   }else{
       $('#blah').hide();
   }
  }
  $("#file").on('change' , function (env) {
   readURL(this);
   var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];
   if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
       if($("#file").val()){
          $('.error-file').show(); 
      }else{
           $('.error-file').hide(); 
      }
       $('#comfim-pd').resetForm();
   }else{
       $('.error-file').hide();
   }
  });
});