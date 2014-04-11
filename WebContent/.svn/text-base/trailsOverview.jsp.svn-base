<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>All Locations</title>	
</head>

<body>
	
	<div id="titleSpace">
		<jsp:include page="templates/header.jsp" />
	</div>
	
	<div class="featured">
	<h2>All Tracked Bills</h2>
		<jsp:include page="GoogleMapsOverview.jsp"></jsp:include>
	</div>
	
	<s:if test="trailJson != null">
		<div id="trailJson" style="display: none;">
			<s:property value="trailJson" />
		</div>
	</s:if>
	
	<div id="footerSpace">
		<jsp:include page="templates/footer.jsp" />
	</div>
	
</body>
</html>