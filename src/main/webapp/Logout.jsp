<%
session.removeAttribute("current-user");
RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
rd.forward(request, response);
%>