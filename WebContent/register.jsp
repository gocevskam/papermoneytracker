<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
<div id="titleSpace">
	<jsp:include page="templates/header.jsp" />
</div>
<div class="featured">

<h2>Registration</h2>
 <div class ="content">

 <s:form name="register" action="register" method="post">
	<s:if test="hasActionErrors()">
		<div class="errors">
			<s:actionerror/>
		</div>
	</s:if>
	<s:textfield label="Username" key="username"/>
	<s:password label="Password"  key="password"/>
	<s:password label="Password Confirmation"  key="passwordConfirmation"/>
	<s:textfield label="Email" key="email"/>
	<s:submit id="registerUser" method="execute" key="label.register" />
</s:form>
 </div>
 </div>
 
 <div id="footerSpace">
	<jsp:include page="templates/footer.jsp" />
</div>
</body>
</html>