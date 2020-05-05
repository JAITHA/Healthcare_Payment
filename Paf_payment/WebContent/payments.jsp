
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.Payment"%>

<!DOCTYPE htmlt>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.4.0.min.js"></script>
<script src="Components/payments.js"></script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-6">


				<h1>HealthCare - Payment System</h1>

				<form id="formPayment" name="formPayment" method="post" action="payments.jsp">
					Payment Amount : <input id="P_Amount" name="P_Amount" type="text"
						class="form-control form-control-sm"> <br> 
					Name on Card : <input id="P_NameOnCard" name="P_NameOnCard" type="text"
						class="form-control form-control-sm"> <br> 
					CVC : <input id="P_CVC" name="P_CVC" type="text"
						class="form-control form-control-sm"> <br> 
					Payment Expiring Date : <input id="P_ExpiringDate" name="P_ExpiringDate" type="text"
						class="form-control form-control-sm"> <br>
					Card Number : <input id="P_CardNumber" name="P_CardNumber" type="text"
						class="form-control form-control-sm"> <br>
					Appointment ID : <input id="P_AppointmentID" name="P_AppointmentID" type="text"
						class="form-control form-control-sm"> <br>
					
					 <input id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <input type="hidden"
						id="hidPaymentIDSave" name="hidPaymentIDSave" value="">
				</form>

				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divPaymentGrid">
					<%
						Payment payObj = new Payment();
					out.print(payObj.readPayments());
					%>
				</div>
</body>
</html>