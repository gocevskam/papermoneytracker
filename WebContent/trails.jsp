<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Trail</title>	
</head>

<body>
	<div id="titleSpace">
		<jsp:include page="templates/header.jsp" />
	</div>

	<div class="featured">
	<h2> The Trail of a Bill </h2>
	
	<jsp:include page="GoogleMaps.jsp"></jsp:include>
	
	<div class ="content">
		
		<table id="trailTable" border="1">
		<tr>
		    <th>Date</th>
			<th>Location</th>
			<th>Comment</th>
			<th>Votes</th>
		</tr>
	</table>

	<s:if test="trailJson != null">
		<div id="trailJson" style="display: none;">
			<s:property value="trailJson" />
		</div>
	</s:if>
		</div>
	</div>
		
	
	
	<div id="footerSpace">
		<jsp:include page="templates/footer.jsp" />
	</div>
	
</body>
</html>