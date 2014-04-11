<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
<style>
		#gridTable {
			padding: 50px 50px 50px 50px;
		}
</style>
</head>
<body>
	<div id="titleSpace">
		<jsp:include page="templates/header.jsp" />
	</div>
	<div class="featured">
		<h2>My Profile</h2>
			</br>
			<h3>My Trackings</h3>
			<div class="content">
				Open the Trackings table below, this gives you an overview of your Trackings.
				You can edit your previously added trackings for mistakes. <br/><br/>
				<jsp:include page="grid.jsp" />
			</div>
			<h3>Change Profile Settings</h3>
			<div class="content">
				Update your profile settings here. <br/><br/>
				<s:form action="updateUser" method="post">
					<s:if test="hasActionErrors()">
						<div class="errors">
							<s:actionerror />
						</div>
					</s:if>
					<s:textfield label="Email" key="email" />
					<s:submit id="Update" method="execute" value="Update" />
				</s:form>
			</div>
	</div>

	<div id="footerSpace">
		<jsp:include page="templates/footer.jsp" />
	</div>
</body>
</html>