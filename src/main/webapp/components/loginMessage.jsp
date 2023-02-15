<%
String message1=(String)session.getAttribute("message1");
String errormessage=(String)session.getAttribute("errormessage");
if(message1!=null)
{
	%>
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong><%=message1 %></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%
session.removeAttribute("message1");
}
else
{
	%>
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong><%=errormessage %></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%
session.removeAttribute("errormessage");
}
%>