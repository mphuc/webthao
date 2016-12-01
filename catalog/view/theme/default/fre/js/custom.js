
function login(){
	$('#login_form').submit(function(){
		var err = {
			login_empty: "Укажите Логин", 
			pass_empty: "Укажите Пароль",
			login_error: "Не верный Логин/Пароль", 
			not_active: 'e-mail не подтвержден',
			banned: "Доступ в аккаунт приостановлен", 
			blocked: 'Аккаунт заблокирован',
			error_form: 'Ошибка формы! Пожалуйста перезагрузите страницу',
			error_data: 'Ошибка данных! Пожалуйста перезагрузите страницу'
		};
		//alert('Форма входа')
		$.ajax(
		{
			type: 'POST',
			url: 'login',
			data: $('#login_form').serialize()+'&form='+$('#login_form #login_btn').attr('name'),
			success: 
				function(data)
				{			
					data = $.parseJSON(data);
					$('#login_form  input').removeClass('error');
					if (data['error'] == 'OK')
					{
						location.replace("cabinet");
					}
					else 
					{
						var t = data['error'].split('_');
						if (t[0] == 'pass')
							$('#login_form #login_password').attr('placeholder', err[data['error']]).addClass('error');
						else if (t[0] == 'site' && t[1] == 'lock')
						{
							$('#login_form #login_username').val('').attr('placeholder', 'Вход отключен').addClass('error');
							$('#login_form #login_password').val('').attr('placeholder', 'Технические работы').addClass('error');
						}					
						else
							$('#login_form #login_username').val('').attr('placeholder', err[data['error']]).addClass('error');
					}
				}
		});
		
		return false;
	})
}

function register(){
	$('#register_form').submit(function(){
		var err = {
			login_empty: 'Укажите логин',
			login_used: 'Логин уже используется',
			email_empty: 'Укажите e-mail',
			email_wrong: 'Неверный e-mail',
			email_used: 'e-mail уже используется',
			pass1_empty: 'Укажите пароль',
			pass1_short: "Пароль слишком короткий",
			pass1_wrong: 'Пароль не соответствует формату',
			pass2_empty: 'Повторите пароль',
			pass2_not_equal: 'Пароли не совпадают',
			pin_short: 'Короткий PIN код',
			pin_empty: 'Введите PIN код',
			sponsor_not_found: "Аккаунт не найден",
			sponsor_is_self: 'Вы не можете быть себе спонсором',
			must_agree_rules: 'Вы должны принять правила',
			error_form: 'Ошибка формы! Пожалуйста перезагрузите страницу',
			error_serificat: 'Ошибка Сертификата! Пожалуйста перезагрузите страницу'
		}
	
		$.ajax(
		{
			type: 'POST',
			url: 'registration',
			data: $('#register_form').serialize()+'&form='+$('#register_form #register').attr('name'),
			success: 
				function(data)
				{			
					data = $.parseJSON(data);
					if (data['error'] == 'OK')
					{
						$('#done #hader').html('Регистрация завершена');
						$('#done #text').html('Теперь Вы можете войти в свой аккаунт, используя <b>Логин и Пароль</b>.');
						$('#end_form').trigger('click');
					}
					else 
					{
						var t = data['error'].split('_');
						
						$('#register_form input').removeClass('error');
						
						if(t[0] == 'login')
							$('#register_form #reg_login').val('').attr('placeholder', err[data['error']]).addClass('error');
						else if(t[0] == 'email')
							$('#register_form #reg_mail').val('').attr('placeholder', err[data['error']]).addClass('error');
						else if(t[0] == 'pass1')
							$('#register_form #reg_pass1').val('').attr('placeholder', err[data['error']]).addClass('error');
						else if(t[0] == 'pass2')
							$('#register_form #reg_pass2').val('').attr('placeholder', err[data['error']]).addClass('error');					
						else if(t[0] == 'sponsor')
							$('#register_form #reg_sponsor').val('').attr('placeholder', err[data['error']]).addClass('error');
						else if(t[0] == 'pin')
							$('#register_form #reg_pin').val('').attr('placeholder', err[data['error']]).addClass('error');
						else if(t[0] == 'need')
							$('#activ').trigger('click');
						// else if(t[0] == 'must')
							// $('#pp_full_res #Agree').html(err[data['error']]).css({'color':'#f00'});
						else
							$('#register_form #reg_login').val('').attr('placeholder', err[data['error']]).addClass('error');
					}
				}
		});
		
		return false;
	})
}

function chkLogin()
{
	$('#reg_login').css({'color':'#000',  'border-color':'#000'});
	$.ajax(
		{
			type: 'POST',
			url: 'registration',
			data: 'chk=login&login='+encodeURIComponent($('#reg_login').val()),
			success: 
				function(ex)
				{
					if (ex == 1)
					{
						$('#reg_login').css({'color':'#f00',  'border-color':'#f00'});
					}
				}
		});
}

function chkMail()
{
	$('#reg_email').css({'color':'#000','border-color':'#000'});
	$.ajax(
		{
			type: 'POST',
			url: 'registration',
			data: 'chk=email&email='+encodeURIComponent($('#reg_email').val()),
			success: 
				function(ex)
				{
					if (ex == 1)
					{
						$('#reg_email').css({'color':'#f00',  'border-color':'#f00'});
					}
				}
		}
	);
}

function kchkLogin() {

	tid2=0;
	$('#reg_login').keypress(
		function()
		{
			clearTimeout(tid2);
			tid2=setTimeout(function(){ chkLogin(); }, 500);
		}
	);
	//chkLogin();
}
	
function kchkMail() {	
	tid=0;
	$('#reg_email').keypress(
		function()
		{
			clearTimeout(tid);
			tid=setTimeout(function(){ chkMail(); }, 500);
		}
	);
}


function resetpass() {
	$('#reset_form').submit(function(){
		var err = {
			login_empty: 'Укажите логин',
			mail_empty: 'Укажите E-Mail',
			mail_wrong: 'Не верный E-Mail',
			login_or_email_error: 'Не верный Логин/E-Mail',
			data_error: 'Ошибка данных',
			cod_error: 'Ошибка отправки кода'
		};
		
		$.ajax(
		{
			type: 'POST',
			url: 'resetpass',
			data: $('#reset_form').serialize()+'&form='+$('#reset_form #reset_btn').attr('name'),
			success: 
				function(data)
				{			
					data = $.parseJSON(data);
					$('#reset_form  input').removeClass('error');
					if (data['error'] == 'OK')
					{
						$('#activ').trigger('click');
					}
					else 
					{
						var t = data['error'].split('_');
						if (t[0] == 'mail')
							$('#reset_form #res_email').val('').attr('placeholder', err[data['error']]).addClass('error');
						else
							$('#reset_form #res_username').val('').attr('placeholder', err[data['error']]).addClass('error');
					}
				}
		});
		
		return false;		
	});	
}

function confirmcode() {
	$('#confirm_form').submit(function(){
		var err = {
			code_empty: 'Укажите код',
			code_wrong: 'Неверный код',
			code_not_actual: 'Код неактуален',
			code_expired: 'Истек срок активации кода',
			oper_wrong: 'Неверная операция',
			oper_unkn: 'Операция не реализована'
		};
			
		$.ajax(
		{
			type: 'POST',
			url: 'resetpass',
			data: $('#confirm_form').serialize()+'&form='+$('#confirm_form #confirm_btn').attr('name'),
			success: 
				function(data)
				{			
					data = $.parseJSON(data);
					$('#confirm_form  input').removeClass('error');
					if (data['error'] == 'OK')
					{
						$('#done #hader').html('Пароль сброшен');
						$('#done #text').html('Теперь Вы cможете войти в свой кабинет, используя <b>временный пароль</b>, который был выслан на почтовый ящик. Проверьте почту.&nbsp; После входа рекомендуем изменить этот временный пароль в личном кабинете.');
						$('#end_form').trigger('click');
					}
					else 
					{
						$('#confirm_form #code').val('').attr('placeholder', err[data['error']]).addClass('error');
					}
				}
		});
		
		return false;		
	});	
}

function chkChangePass() {
	$('#changepass_form').submit(function(){
		var err = {
			oldpass_empty: 'Укажите старый пароль',
			oldpass_wrong: 'Не правельный пароль',
			newpass_empty: 'Укажите новый пароль',
			reppass_empty: 'Повторите пароль',
			pass_not_equal: 'Пароли не совпадают'
		};
		var gdata;
		
		$.ajax(
		{
			type: 'POST',
			url: 'changepass',
			data: 'chk=changepass&'+$('#changepass_form').serialize(),
			async: false,
			success: 
				function(data){
					gdata = $.parseJSON(data);
				}
		});
		
		$('#changepass_form input').css({'color':'#000',  'border-color':'#DCDCDC'});
					
		if (isNaN(gdata))
		{
			$.each(gdata, function(k, v){
				$('#changepass_form #'+k).val('').attr('placeholder', err[v]).css({'color':'#f00', 'border-color':'#f00'});
			});	
			return false;
		}
		else 
			return true;
	});	
}

function chkChangeMail() {
	$('#changemail_form').submit(function(){
		var err = {
			pass_empty: 'Укажите пароль',
			pass_wrong: 'Не правельный пароль',
			email_empty: 'Укажите новый E-mail',
			email_used: 'E-mail используется',
			email_wrong: 'Не верный E-mail'
		};
		var gdata;
		
		$.ajax(
		{
			type: 'POST',
			url: 'changemail',
			data: 'chk=changemail&'+$('#changemail_form').serialize(),
			async: false,
			success: 
				function(data){
					gdata = $.parseJSON(data);
				}
		});
		
		$('#changemail_form input').css({'color':'#000',  'border-color':'#DCDCDC'});
					
		if (isNaN(gdata))
		{
			$.each(gdata, function(k, v){
				$('#changemail_form #'+k).val('').attr('placeholder', err[v]).css({'color':'#f00', 'border-color':'#f00'});
			});	
			return false;
		}
		else 
			return true;
	});	
}

$(document).ready(function(){
	login();
	register();
	resetpass();
	confirmcode();
});

