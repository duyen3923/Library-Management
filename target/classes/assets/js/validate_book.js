$(function(){

	$("#amountBook_error").hide();

	

	var amountBook_error = false;
	
	

	$("#amountBook").focusout(function(){
		checkAmountBook();
		toggleSubmitButton();
	});
	
	function checkAmountBook(){
		if($("#amountBook").val().length == 0){
			$("#amountBook_error").html("Vui lòng nhập vào số lượng sách");
			amountBook_error = true;
			$("#amountBook_error").show();     
		}
		else{
			amountBook_error = false;
			$("#amountBook_error").hide();
		}
	}
	
	function toggleSubmitButton() {
	    if (amountBook_error) { // TH NHAP THIEU
	        $("#book_form").prop("disabled", true);
	    } else {
	        $("#book_form").prop("disabled", false);
	    }
	}
	$("#book_form").submit(function() {
		
		checkAmountBook
	
		if( amountBook_error){
			return true;
		}
		else{
			return false;
		}
	});
});