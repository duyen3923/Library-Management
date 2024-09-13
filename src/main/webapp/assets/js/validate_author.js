$(function(){
	$("#nameAuthor_error").hide();
	$("#imageAuthor_error").hide();
	$("#descriptionAuthor_error").hide();
	
	var nameAuthor_error =false;
	var imageAuthor_error = false;
	var descriptionAuthor_error = false ;
	
	$("#nameAuthor").focusout(function(){
		checkNameAu();
		toggleSubmitButton();
	});
	$("#imageAuthor").focusout(function(){
		checkImageAu();
		toggleSubmitButton();
	});
	$("#descriptionAuthor").focusout(function(){
		checkDescriptionAu();
		toggleSubmitButton();
	});
	
	function checkNameAu(){
		if($("#nameAuthor").val().length == 0){
			$("#nameAuthor_error").html("Vui lòng nhập vào tên tác giả");
			nameAuthor_error = true;
			$("#nameAuthor_error").show();     
		}
		else{
			nameAuthor_error = false;
			$("#nameAuthor_error").hide();
		}
	}
	function checkImageAu(){
		if($("#imageAuthor").val().length == 0){
			$("#imageAuthor_error").html("Vui lòng chọn ảnh tác giả");
			imageAuthor_error = true;
			$("#imageAuthor_error").show();     
		}
		else{
			imageAuthor_error = false;
			$("#imageAuthor_error").hide();
		}
	}
	function checkDescriptionAu(){
		if($("#descriptionAuthor").val().length == 0){
			$("#descriptionAuthor_error").html("Vui lòng nhập vào mô tả");
			descriptionAuthor_error = true;
			$("#descriptionAuthor_error").show();     
		}
		else{
			descriptionAuthor_error = false;
			$("#descriptionAuthor_error").hide();
		}
	}
	function toggleSubmitButton() {
	    if (!nameAuthor_error && !imageAuthor_error && !descriptionAuthor_error) {
	        $("#author_form").prop("disabled", false);
	    } else {
	        $("#author_form").prop("disabled", true);
	    }
	}
	$("#author_form").submit(function() {
		checkNameAu();
		checkImageAu();
		checkDescriptionAu();
		if(nameAuthor_error || imageAuthor_error || descriptionAuthor_error){
			return false;
		}
		else{
			return true;
		}
	});
});