$(document).ready(function(){
	alert("Page Loaded");
});

//validations================================================================================================================================


function validatePaymentForm() {
	if ($("#name").val().trim() == "") {
		return "Insert Name.";
	}
	if ($("#account_no").val().trim() == "") {
		return "Insert Account_no.";
	}
	if ($("#amount").val().trim() == "") {
		return "Insert Amount.";
	}
	if ($("#card_no").val().trim() == "") {
		return "Insert Card_no.";
			}
	if ($("#security_code").val().trim() == "") {
		return "Insert Security_code.";
			}
	if ($("#expiration_date").val().trim() == "") {
		return "Insert Expiration_date.";
		}



	return true;
}


// SAVE ============================================
$(document).on("click", "#addPayment", function(event) { 
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide(); 
		
		// Form validation-------------------
		var status = validatePaymentForm(); if (status != true) {
			$("#alertError").text(status);
			$("#alertError").show();
				return;
		} $.ajax({
				url : "PaymentServlet",
				type : "post",
				data : $("#addformUser").serialize(),
				dataType : "text",
				complete : function(response, status) {
				onPaymentSaveComplete(response.responseText, status);
			}
		});
});

function onPaymentSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {	
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidPaymentIDSave").val("");
	$("#formPayment")[0].reset();

}
