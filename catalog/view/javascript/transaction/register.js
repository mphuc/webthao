$( document ).ready(function() {
function readURL(input) {
   if (input.files && input.files[0]) {
       var reader = new FileReader();

       reader.onload = function (e) {
           $('#blah').attr('src', e.target.result).show();
          
           $('.img_profile').hide();
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
$( document ).ready(function() {
    $('input#phone').keydown(function(event) {
        if (event.keyCode === 13) {
            return true;
        }
        if (!(event.keyCode == 8 || event.keyCode == 46 || (event.keyCode >= 35 && event.keyCode <= 40) || (event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105))) {
            event.preventDefault();
        }
    });

    $('input#cmnd').keydown(function(event) {
        if (event.keyCode === 13) {
            return true;
        }
        if (!(event.keyCode == 8 || event.keyCode == 46 || (event.keyCode >= 35 && event.keyCode <= 40) || (event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105))) {
            event.preventDefault();
        }
    });


    $('#register-account').on('submit', function(event) {

        $.fn.existsWithValue = function() {
            return this.length && this.val().length;
        };
        var self = $(this);
        var isValidEmailAddress = function(email, callback) {
            var pattern = new RegExp(/^(("[\w-+\s]+")|([\w-+]+(?:\.[\w-+]+)*)|("[\w-+\s]+")([\w-+]+(?:\.[\w-+]+)*))(@((?:[\w-+]+\.)*\w[\w-+]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][\d]\.|1[\d]{2}\.|[\d]{1,2}\.))((25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\.){2}(25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\]?$)/i);
            callback(pattern.test(email));
        };

        var validate = {
            init: function(self) {
                self.find('#username').parent().removeClass('has-error');
                self.find('#user-error').hide();
                 self.find('#bitcoinWalletAddress').parent().removeClass('has-error');
                self.find('#bitcoinWalletAddress-error').hide();
                self.find('#email').parent().removeClass('has-error');
                self.find('#email-error').hide();
                self.find('#phone').parent().removeClass('has-error');
                self.find('#phone-error').hide();
                self.find('#cmnd').parent().removeClass('has-error');
                self.find('#cmnd-error').hide();
                self.find('#country').parent().removeClass('has-error');
                self.find('#country-error').hide();
                self.find('#password').parent().removeClass('has-error');
                self.find('#password-error').hide();
                self.find('#password2').parent().removeClass('has-error');
                self.find('#password2-error').hide();
                self.find('#confirmpassword').parent().removeClass('has-error');
                self.find('#confirmpassword-error').hide();
                self.find('#confirmpasswordtransaction').parent().removeClass('has-error');
                self.find('#confirmpasswordtransaction-error').hide();
                self.find('#question').parent().removeClass('has-error');
                self.find('#question-error').hide();
                self.find('#answers').parent().removeClass('has-error');
                self.find('#answers-error').hide();
                self.find('#file').parent().removeClass('has-error');
                self.find('#file-error').hide();
                self.find('#agreeTerm').parent().removeClass('has-error');
                self.find('#agreeTerm-error').hide();
                self.find('#passwordtran').parent().removeClass('has-error');
                self.find('#passwordtran-error').hide();
                self.find('#passwordtranrepeat').parent().removeClass('has-error');
                self.find('#passwordtranrepeat-error').hide();
                $('#agreeTerm').is(":checked") && $('#agreeTerm').removeClass('validation-error');
            },

            userName: function(self) {
                if (self.find('#username').existsWithValue() === 0) {
                    self.find('#username').parent().addClass('has-error');
                    self.find('#user-error').show();
                    self.find('#user-error span').html('Please enter user name');
                    return false;
                }
                return true;
            },
            email: function(self) {
                if (self.find('#email').existsWithValue() === 0) {
                    self.find('#email').parent().addClass('has-error');
                    self.find('#email-error').show();
                    self.find('#email-error span').html('Please enter email address');
                    return false;
                }
                return true;
            },

            phone: function(self) {
                if (self.find('#phone').existsWithValue() === 0) {
                    self.find('#phone').parent().addClass('has-error');
                    self.find('#phone-error').show();
                    self.find('#phone-error span').html('Please enter phone number');
                    return false;
                }
                return true;
            },
             cmnd: function(self) {
                if (self.find('#cmnd').existsWithValue() === 0) {
                    self.find('#cmnd').parent().addClass('has-error');
                    self.find('#cmnd-error').show();
                    self.find('#cmnd-error span').html('The Citizenship card/passport no field is required');
                    return false;
                }
                return true;
            },
            country: function(self) {
                if ($('#country').val() == 0) {
                    self.find('#country').parent().addClass('has-error');
                    self.find('#country-error').show();
                    self.find('#country-error span').html('Please select the country');
                    return false;
                }
                return true;
            },
            bitcoinWalletAddress: function(self) {

                if (self.find('#bitcoinWalletAddress').existsWithValue() === 0) {
                    self.find('#bitcoinWalletAddress-error').parent().addClass('has-error');
                   self.find('#bitcoinWalletAddress-error').show();
                    self.find('#bitcoinWalletAddress-error span').html('Please enter your bitcoin wallet!');

                    return false;
                }
                return true;
            },
            

           
            
            password: function(self) {
                if (self.find('#password').existsWithValue() === 0) {
                    self.find('#password').parent().addClass('has-error');
                    self.find('#password-error').show();
                    self.find('#password-error span').html('Please enter password for login');
                    return false;
                }
                return true;
            },
           
            repeatPasswdnull: function(self) {
                if (self.find('#confirmpassword').val() === 0) {
                    self.find('#confirmpassword').parent().addClass('has-error');
                    self.find('#confirmpassword-error').show();
                    self.find('#confirmpassword-error span').html('Repeat password for login not correct');
                    
                    return false;
                }
                return true;
            },
            repeatPasswd: function(self) {
                if (self.find('#confirmpassword').val() !== self.find('#password').val()) {
                    self.find('#confirmpassword').parent().addClass('has-error');
                    self.find('#confirmpassword-error').show();
                    self.find('#confirmpassword-error span').html('Repeat password for login not correct');
                    return false;
                }
                return true;
            },

            passwordtran: function(self) {
                if (self.find('#passwordtran').existsWithValue() === 0) {
                    self.find('#passwordtran').parent().addClass('has-error');
                    self.find('#passwordtran-error').show();
                    self.find('#passwordtran-error span').html('Please enter password for transaction');
                    return false;
                }
                return true;
            },

            passwordtranrepeat: function(self) {
                if (self.find('#passwordtranrepeat').val() !== self.find('#passwordtran').val()) {
                    self.find('#passwordtranrepeat').parent().addClass('has-error');
                    self.find('#passwordtranrepeat-error').show();
                    self.find('#passwordtranrepeat-error span').html('Repeat password for transaction not correct');
                    return false;
                }
                return true;
            },
            question: function(self) {
               
                if (self.find('#question').val() === "") {
                    self.find('#question').parent().addClass('has-error');
                    self.find('#question-error').show();
                    self.find('#question-error span').html('Please enter Secret question');
                    return false;
                }

                return true;
            },

             answers: function(self) {
                if (self.find('#answers').existsWithValue() === 0) {
                    self.find('#answers').parent().addClass('has-error');
                    self.find('#answers-error').show();
                    self.find('#answers-error span').html('Please enter Answers to the secret question');
                    return false;
                }
                return true;
            },
            avartar:function(self) {
                if ($('#file').val() == ""){

                    self.find('#file').parent().addClass('has-error');
                    self.find('#file-error').show();
                    self.find('#file-error span').html('Please select the file');
                    return false;
                } 
                var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];
                   if ($.inArray($('#file').val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                       if($("#file").val()){
                        self.find('#file-error').show();
                        self.find('#file-error span').html('Please select images');
                          return false;
                      }
                    }
                 return true;
            },
             agreeTerm: function(self) {
                if($("#agreeTerm").is(':checked')){
                    return true;
                }
                
                else
                {
                    self.find('#agreeTerm').parent().addClass('has-error');
                    self.find('#agreeTerm-error').show();
                    self.find('#agreeTerm-error span').html('Do you agree with the terms of service?');
                    return false;
                }
            },
            checkUserExit: function(self, callback) {
                if (self.find('#username').existsWithValue() !== 0) {
                    $.ajax({
                        url: self.find('#username').data('link'),
                        type: 'GET',
                        data: {
                            'username': self.find('#username').val()
                        },
                        async: false,
                        success: function(result) {
                            result = $.parseJSON(result);
                            callback(result.success === 0);
                        }
                    });
                }
            },

            checkEmailExit: function(self, callback) {
                if (self.find('#email').existsWithValue() !== 0) {
                    $.ajax({
                        url: self.find('#email').data('link'),
                        type: 'GET',
                        data: {
                            'email': self.find('#email').val()
                        },
                        async: false,
                        success: function(result) {

                            result = $.parseJSON(result);
            
                            callback(result.success === 0);
                        }
                    });
                }
            },
            checkPhoneExit: function(self, callback) {
                if (self.find('#phone').existsWithValue() !== 0) {
                    $.ajax({
                        url: self.find('#phone').data('link'),
                        type: 'GET',
                        data: {
                            'phone': self.find('#phone').val()
                        },
                        async: false,
                        success: function(result) {
                            result = $.parseJSON(result);
                            callback(result.success === 0);
                        }
                    });
                }
            },

            checkCMND: function(self, callback) {
                if (self.find('#cmnd').existsWithValue() !== 0) {
                    $.ajax({
                        url: self.find('#cmnd').data('link'),
                        type: 'GET',
                        data: {
                            'cmnd': self.find('#cmnd').val()
                        },
                        async: false,
                        success: function(result) {
                            result = $.parseJSON(result);
                            callback(result.success === 0);
                        }
                    });
                }
            },
            check_bitcoinWalletAddress: function(self, callback) {
                if (self.find('#bitcoinWalletAddress').existsWithValue() !== 0) {
                    $.ajax({
                        url: self.find('#bitcoinWalletAddress').data('link'),
                        type: 'GET',
                        data: {
                            'wallet': self.find('#bitcoinWalletAddress').val()
                        },
                        async: false,
                        success: function(result) {
                            result = $.parseJSON(result);
                            callback(result.wallet === 0);
                        }
                    });
                }
            },
        };


        validate.init($(this));
       
        if (validate.userName($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            self.find('#username').parent().addClass('has-success');
        }

        if (validate.email($(this)) === false) {
            return false;
        } else {
            var checkEmail = null;
            isValidEmailAddress(self.find('#email').val(), function(callback) {
                checkEmail = !callback ? true : false;
            });
            if (checkEmail) {
                self.find('#email').parent().addClass('has-error');
                self.find('#email-error').show();
                self.find('#email-error span').html('Please enter email address');
                return false;
            } else {
                validate.init($(this));
                self.find('#email').parent().addClass('has-success');
            }
        }
        if (validate.phone($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            self.find('#phone').parent().addClass('has-success');
        }
        if (validate.cmnd($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            self.find('#cmnd').parent().addClass('has-success');
        }
        if (validate.country($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            self.find('#country').parent().addClass('has-success');
        }
         if (validate.bitcoinWalletAddress($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            self.find('#bitcoinWalletAddress').parent().addClass('has-success');
        }


        if (validate.password($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            self.find('#password').parent().addClass('has-success');
        }

        
        if (validate.repeatPasswd($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            self.find('#confirmpassword').parent().addClass('has-success');
        }
         if (validate.passwordtran($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            self.find('#passwordtran').parent().addClass('has-success');
        }
        if (validate.passwordtranrepeat($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            self.find('#passwordtranrepeat').parent().addClass('has-success');
        }
       /* if (validate.question($(this)) === false) {
           
            return false;
        } else {
            
            validate.init($(this));
            self.find('#question').parent().addClass('has-success');
        }

        if (validate.answers($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            self.find('#answers').parent().addClass('has-success');
        }*/
         if (validate.avartar($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            
        }
         if (validate.agreeTerm($(this)) === false) {
            return false;
        } else {
            validate.init($(this));
            self.find('#agreeTerm').parent().addClass('has-success');
        }

        var checkUser = null;
        var checkEmail = null;
        var checkPhone = null;
        var checkCMND = null;
        var check_bitcoinWalletAddress =null;

        validate.checkUserExit($(this), function(callback) {
            validate.init($(this));
            if (!callback) {
                self.find('#username').parent().addClass('has-error');
                self.find('#user-error').show();
                self.find('#user-error span').html('This user name is already exists');
                self.find('#password').val('');
                self.find('#password').parent().removeClass('has-success');
                self.find('#confirmpassword').val('');
                self.find('#confirmpassword').parent().removeClass('has-success');
                // self.find('#password2').val('');
                self.find('#password2').parent().removeClass('has-success');
                // self.find('#confirmpasswordtransaction').val('');
                self.find('#confirmpasswordtransaction').parent().removeClass('has-success');
                return false;
            } else {
                self.find('#username').parent().removeClass('has-error');
                self.find('#user-error').hide();
                self.find('#email').parent().removeClass('has-error');
                self.find('#email-error').hide();
                self.find('#phone').parent().removeClass('has-error');
                self.find('#phone-error').hide();
                self.find('#cmnd').parent().removeClass('has-error');
                self.find('#cmnd-error').hide();
                self.find('#bitcoinWalletAddress').parent().removeClass('has-error');
                self.find('#bitcoinWalletAddress-error').hide();
                self.find('#country').parent().removeClass('has-error');
                self.find('#country-error').hide();
                self.find('#password').parent().removeClass('has-error');
                self.find('#password-error').hide();
                self.find('#password2').parent().removeClass('has-error');
                self.find('#password2-error').hide();
                self.find('#confirmpassword').parent().removeClass('has-error');
                self.find('#confirmpassword-error').hide();
                self.find('#confirmpasswordtransaction').parent().removeClass('has-error');
                self.find('#confirmpasswordtransaction-error').hide();
                $('#agreeTerm').is(":checked") && $('#agreeTerm').removeClass('validation-error');
                self.find('#username').parent().addClass('has-success');
                checkUser = true;
            }
        });

        if (checkUser) {
            validate.checkEmailExit($(this), function(callback) {
                if (!callback) {
                    self.find('#email').parent().addClass('has-error');
                    self.find('#email-error').show();
                    self.find('#email-error span').html('This email is already exists');
                    self.find('#password').val('');
                    self.find('#password').parent().removeClass('has-success');
                    self.find('#confirmpassword').val('');
                    self.find('#confirmpassword').parent().removeClass('has-success');
                    // self.find('#password2').val('');
                    self.find('#password2').parent().removeClass('has-success');
                    // self.find('#confirmpasswordtransaction').val('');
                    self.find('#confirmpasswordtransaction').parent().removeClass('has-success');
                    return false;
                } else {
                    self.find('#username').parent().removeClass('has-error');
                    self.find('#user-error').hide();
                    self.find('#email').parent().removeClass('has-error');
                    self.find('#email-error').hide();
                    self.find('#phone').parent().removeClass('has-error');
                    self.find('#phone-error').hide();
                    self.find('#cmnd').parent().removeClass('has-error');
                    self.find('#cmnd-error').hide();
                    self.find('#bitcoinWalletAddress').parent().removeClass('has-error');
                    self.find('#bitcoinWalletAddress-error').hide();
                    self.find('#country').parent().removeClass('has-error');
                    self.find('#country-error').hide();
                    self.find('#password').parent().removeClass('has-error');
                    self.find('#password-error').hide();
                    self.find('#password2').parent().removeClass('has-error');
                    self.find('#password2-error').hide();
                    self.find('#confirmpassword').parent().removeClass('has-error');
                    self.find('#confirmpassword-error').hide();
                    self.find('#confirmpasswordtransaction').parent().removeClass('has-error');
                    self.find('#confirmpasswordtransaction-error').hide();
                    $('#agreeTerm').is(":checked") && $('#agreeTerm').removeClass('validation-error');
                    self.find('#email').parent().addClass('has-success');
                    checkEmail = true;
                }
            });
        };

        if (checkUser && checkEmail) {
            validate.checkPhoneExit($(this), function(callback) {
                if (!callback) {
                    self.find('#phone').parent().addClass('has-error');
                    self.find('#phone-error').show();
                    self.find('#phone-error span').html('This phone is already exists');
                    self.find('#password').val('');
                    self.find('#password').parent().removeClass('has-success');
                    self.find('#confirmpassword').val('');
                    self.find('#confirmpassword').parent().removeClass('has-success');
                    // self.find('#password2').val('');
                    self.find('#password2').parent().removeClass('has-success');
                    // self.find('#confirmpasswordtransaction').val('');
                    self.find('#confirmpasswordtransaction').parent().removeClass('has-success');
                    return false;
                } else {
                    self.find('#username').parent().removeClass('has-error');
                    self.find('#user-error').hide();
                    self.find('#email').parent().removeClass('has-error');
                    self.find('#email-error').hide();
                    self.find('#phone').parent().removeClass('has-error');
                    self.find('#phone-error').hide();
                    self.find('#cmnd').parent().removeClass('has-error');
                    self.find('#cmnd-error').hide();
                    self.find('#bitcoinWalletAddress').parent().removeClass('has-error');
                    self.find('#bitcoinWalletAddress-error').hide();
                    self.find('#country').parent().removeClass('has-error');
                    self.find('#country-error').hide();
                    self.find('#password').parent().removeClass('has-error');
                    self.find('#password-error').hide();
                    self.find('#password2').parent().removeClass('has-error');
                    self.find('#password2-error').hide();
                    self.find('#confirmpassword').parent().removeClass('has-error');
                    self.find('#confirmpassword-error').hide();
                    self.find('#confirmpasswordtransaction').parent().removeClass('has-error');
                    self.find('#confirmpasswordtransaction-error').hide();
                    $('#agreeTerm').is(":checked") && $('#agreeTerm').removeClass('validation-error');
                    self.find('#phone').parent().addClass('has-success');
                    checkPhone = true;
                }
            });
        };
        if (checkUser && checkEmail && checkPhone) {
            validate.checkCMND($(this), function(callback) {
                if (!callback) {
                    self.find('#cmnd').parent().addClass('has-error');
                    self.find('#cmnd-error').show();
                    self.find('#cmnd-error span').html('This citizenship card/passport no is already exists');
                    self.find('#password').val('');
                    self.find('#password').parent().removeClass('has-success');
                    self.find('#confirmpassword').val('');
                    self.find('#confirmpassword').parent().removeClass('has-success');
                    // self.find('#password2').val('');
                    self.find('#password2').parent().removeClass('has-success');
                    // self.find('#confirmpasswordtransaction').val('');
                    self.find('#confirmpasswordtransaction').parent().removeClass('has-success');
                    return false;
                } else {
                    self.find('#username').parent().removeClass('has-error');
                    self.find('#user-error').hide();
                    self.find('#email').parent().removeClass('has-error');
                    self.find('#email-error').hide();
                    self.find('#phone').parent().removeClass('has-error');
                    self.find('#phone-error').hide();
                    self.find('#cmnd').parent().removeClass('has-error');
                    self.find('#cmnd-error').hide();
                    self.find('#country').parent().removeClass('has-error');
                    self.find('#country-error').hide();
                    self.find('#password').parent().removeClass('has-error');
                    self.find('#password-error').hide();
                    self.find('#password2').parent().removeClass('has-error');
                    self.find('#password2-error').hide();
                    self.find('#confirmpassword').parent().removeClass('has-error');
                    self.find('#confirmpassword-error').hide();
                    self.find('#confirmpasswordtransaction').parent().removeClass('has-error');
                    self.find('#confirmpasswordtransaction-error').hide();
                    $('#agreeTerm').is(":checked") && $('#agreeTerm').removeClass('validation-error');
                    self.find('#cmnd').parent().addClass('has-success');
                    checkCMND = true;
                }
            });
        }
        if (checkUser && checkEmail && checkPhone && checkCMND) {
            validate.check_bitcoinWalletAddress($(this), function(callback) {
                if (!callback) {
                    self.find('#bitcoinWalletAddress').parent().addClass('has-error');
                    self.find('#bitcoinWalletAddress-error').show();
                    self.find('#bitcoinWalletAddress-error span').html('Wrong bitcoin wallet address!!');
                    self.find('#password').val('');
                    self.find('#password').parent().removeClass('has-success');
                    self.find('#confirmpassword').val('');
                    self.find('#confirmpassword').parent().removeClass('has-success');
                    // self.find('#password2').val('');
                    self.find('#password2').parent().removeClass('has-success');
                    // self.find('#confirmpasswordtransaction').val('');
                    self.find('#confirmpasswordtransaction').parent().removeClass('has-success');
                    return false;
                } else {
                    self.find('#username').parent().removeClass('has-error');
                    self.find('#user-error').hide();
                    self.find('#email').parent().removeClass('has-error');
                    self.find('#email-error').hide();
                    self.find('#phone').parent().removeClass('has-error');
                    self.find('#phone-error').hide();
                    self.find('#cmnd').parent().removeClass('has-error');
                    self.find('#cmnd-error').hide();
                    self.find('#bitcoinWalletAddress').parent().removeClass('has-error');
                    self.find('#bitcoinWalletAddress-error').hide();
                    self.find('#country').parent().removeClass('has-error');
                    self.find('#country-error').hide();
                    self.find('#password').parent().removeClass('has-error');
                    self.find('#password-error').hide();
                    self.find('#password2').parent().removeClass('has-error');
                    self.find('#password2-error').hide();
                    self.find('#confirmpassword').parent().removeClass('has-error');
                    self.find('#confirmpassword-error').hide();
                    self.find('#confirmpasswordtransaction').parent().removeClass('has-error');
                    self.find('#confirmpasswordtransaction-error').hide();
                    $('#agreeTerm').is(":checked") && $('#agreeTerm').removeClass('validation-error');
                    self.find('#bitcoinWalletAddress').parent().addClass('has-success');
                    check_bitcoinWalletAddress = true;
                }
            });
        }
        if (!self.find('#agreeTerm').is(":checked")) {
            self.find('#agreeTerm').addClass('validation-error');
            return false;
        } else {
            $('#agreeTerm').is(":checked") && $('#agreeTerm').removeClass('validation-error');
        }

        
        if(checkUser && checkEmail && checkPhone && checkCMND && check_bitcoinWalletAddress && self.find('#agreeTerm').is(":checked")){

            window.funLazyLoad.start();
            $('.btn-register').hide();
            return true;
        }

        return false;

    });
});