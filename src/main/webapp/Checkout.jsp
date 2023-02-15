<%
User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are Not Logged in!! Login First to access Checkout Page");
	RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
	rd.forward(request, response);
	return;
}
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="components/Common_css_js.jsp"%>
</head>
<body>
<%@include file="components/Navbar.jsp"%>
<div class="container">
	<div class="row mt-5">
		<div class="col-md-6">
		<!-- Card  -->
		<div class="card">
			<div class="card-body">
			<h3 class="text-center mb-3">Your Cart</h3>
			<div class="cart-body">
			
		 	</div>
		</div>
			
		</div>
		</div>
		<!-- Form Details -->
		<div class="col-md-6">
		<div class="card">
			<div class="card-body">
			<h3 class="text-center mb-3">Your Details For Order</h3>
			<form action="">
			<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input value="<%=user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
			<div class="form-group">
    <label for="name">Your Name</label>
    <input value="<%=user.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Shipping Address</label>
    <textarea value="<%=user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1"placeholder="Enter Your Address" rows="3"></textarea>
  </div>
  <div class="container text-center">
  	<button class="btn btn-outline-success">Order Now</button>
  	<button class="btn btn-outline-primary">Continue Shopping</button>
  </div>
			</form>
			
		</div>
			
		</div>
		
		</div>
	</div>
</div>




<%@include file="components/common_modals.jsp" %>
</body>
</html>