$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	var type = ($("#hidPaymentIDSave").val() == "") ? "POST" : "PUT";

	$.ajax({
		url : "PaymentApi",
		type : type,
		data : $("#formPayment").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});
});

//UPDATE==========================================
function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divPaymentGrid").html(resultSet.data);
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

$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "PaymentApi",
		type : "DELETE",
		data : "P_PaymentID=" + $(this).data("paymentid"),
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
		}
	});
});

//DELETE==========================================
function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divPaymentGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

// UPDATE==========================================
$(document).on(
		"click",
		".btnUpdate",
		function(event) {
			$("#hidPaymentIDSave").val(
					$(this).closest("tr").find('#hidpaymentIDUpdate').val());
			$("#P_Amount").val($(this).closest("tr").find('td:eq(0)').text());
			$("#P_NameOnCard").val($(this).closest("tr").find('td:eq(1)').text());
			$("#P_CVC").val($(this).closest("tr").find('td:eq(2)').text());
			$("#P_ExpiringDate").val($(this).closest("tr").find('td:eq(3)').text());
			$("#P_CardNumber").val($(this).closest("tr").find('td:eq(4)').text());
			$("#P_AppointmentID").val($(this).closest("tr").find('td:eq(5)').text());
		});

// CLIENTMODEL=========================================================================
function validateItemForm() {
	// AMOUNT
	if ($("#P_Amount").val().trim() == "") {
		return "Insert Payment Amount.";
	}
	// is numerical value
	var tmpAmount = $("#P_Amount").val().trim();
	if (!$.isNumeric(tmpAmount)) {
		return "Insert a numerical value for Payment Amount.";
	}
	// convert to decimal Amount
	$("#P_Amount").val(parseFloat(tmpAmount).toFixed(2));
	
	// NAME ON CARD
	if ($("#P_NameOnCard").val().trim() == "") {
		return "Insert Item Name.";
	}
	// CVC-------------------------------
	if ($("#P_CVC").val().trim() == "") {
		return "Insert CVC.";
	}
	if ($("#P_ExpiringDate").val().trim() == "") {
		return "Insert Expiring Date.";
	}
	
	if ($("#P_CardNumber").val().trim() == "") {
		return "Insert Card Number.";
	}
	
	if ($("#P_AppointmentID").val().trim() == "") {
		return "Insert AppointmentID.";
	}
	return true;
}
