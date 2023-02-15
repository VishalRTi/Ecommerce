
<%
User user2 = (User) session.getAttribute("current-user");
if (user2 == null) {
	session.setAttribute("message", "You are Not Logged in!! Login First");
	RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
	rd.forward(request, response);
	return;
} else {
	if (user2.getUserType().equals("normal")) {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Normal User</title>
<%@include file="components/Common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/Navbar.jsp"%>
	<h1 class="text-center">User Panel</h1>
	<div class="container text-center">
		<div class="card">
			<div class="card-body text-center">

				<div class="container">
					<img style="max-width: 125px;" class="img-fluid rounded-circle"
						alt="user_icon" src="img/man.png">
				</div>
				<h1 class="text-uppercase text-muted"><%=user2.getUserName()%></h1>
				<h3>Name:-<%=user2.getUserName()%></h3>
				<h3>Email:-<%=user2.getUserEmail()%></h3>	
				<h3>Contact-Details:-<%=user2.getUserPhno()%></h3>		
				<h3>Address:-<%=user2.getUserAddress()%></h3><br>
					
					<a href="index.jsp">HomePage</a>
			</div>
		</div>
	</div>
</body>
</html>
<%
}
}
%>

