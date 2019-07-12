<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "spring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Your Information</title>
</head>
<body>

<%
   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); //for http 1.1 
   response.addHeader("Pragma", "no-cache"); //for older http versions--http 1.0
   response.addDateHeader ("Expires", 0); // for proxies
		
%>

<h1>Make your profile changes</h1>

	<spring:form action="${pageContext.request.contextPath }/update" method="post" modelAttribute="infoCustomer">
	
		<table>
			<tr>
				<td><spring:label path="fname">FirstName</spring:label> </td>
				<td><spring:input path="fname"/> </td>
			</tr>
				
			<tr>
				<td><input type="submit" value="Update"/> </td>
			</tr>	
		</table>
	
	</spring:form>

</body>
</html>