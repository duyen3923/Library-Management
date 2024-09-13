$(function(){
	$("#name_error").hide();
	$("#username_error").hide();
	$("#mail_error").hide();
	$("#password_error").hide();


	var name_error = false;
	var username_error = false;
	var mail_error = false;
	var password_error = false;

	

	$("#name").focusout(function() {
		checkName();
		toggleSubmitButton();
	});
	$("#username").focusout(function() {
		checkUsername();
		toggleSubmitButton();
	});
	$("#mail").focusout(function() {
		checkMail();
		toggleSubmitButton();
	});
	$("#password").focusout(function() {
		checkPassword();
		toggleSubmitButton();
	});
	
	function checkTitle(){
		if($("#title").val().length == 0){
			$("#title_error").html("Vui lòng nhập vào tiêu đề");
			name_error = true;
			$("#title_error").show();     
		}
		else{
			name_error = false;
			$("#title_error").hide();
		}
	}

	function checkName(){
		if($("#name").val().length == 0){
			$("#name_error").html("Vui lòng nhập vào họ tên");
			name_error = true;
			$("#name_error").show();     
		}
		else{
			name_error = false;
			$("#name_error").hide();
		}
	}
	function checkUsername(){
		if($("#username").val().length == 0){
			$("#username_error").html("Vui lòng nhập vào tên đăng nhập");
			username_error = true;
			$("#username_error").show();
		}else if($("#username").val().length < 6){
			$("#username_error").html("Tên đăng nhập phải có ít nhất 6 kí tự");
			username_error = true;
			$("#username_error").show();
		}
		else{
			username_error = false;
			$("#username_error").hide();
		}
	}
	function checkMail() {
	    var email = $("#mail").val();
	    var mail_error = false;
	    
	    if(email.length == 0){
	        $("#mail_error").html("Vui lòng nhập vào mail");
	        mail_error = true;
	        $("#mail_error").show();
	    } else {
	        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	        if(!emailPattern.test(email)){
	            $("#mail_error").html("Vui lòng nhập đúng định dạng");
	            mail_error = true;
	            $("#mail_error").show();
	        } else {
	            $("#mail_error").hide();
	            mail_error = false;
	        }
	    }
	    return mail_error;
	}
	function checkPassword(){
		if($("#password").val().length < 6 || $("#password_error").val().length > 15){
			$("#password_error").html("Password phải có 6-15 kí tự");
			password_error = true;
			$("#password_error").show();
		}
		else{
			password_error = false;
			$("#password_error").hide();
		}
	}
	
	function toggleSubmitButton() {
	    if (!name_error && !username_error && !mail_error && !password_error) {
	        $("#register_form").prop("disabled", false);
	    } else {
	        $("#register_form").prop("disabled", true);
	    }
	}
	$("#register_form").submit(function() {
		checkName();
		checkPassword();
		checkMail();
		checkUsername();

		if(name_error || username_error || mail_error || password_error ){
			return false;
		}
		else{
			return true;
		}
	});
});