<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<sj:head jqueryui="true" jquerytheme="cupertino" />
</head>
<body>
<s:url var="remoteurl" action="AllTrackings-json-table"/>
	<sjg:grid 
			id="gridtable"
			caption="Top 10 Trackings" 
			dataType="json"
			pager="true" 
			href="%{remoteurl}"
			gridModel="gridModelAllTrackings" 
			rowNum="-1"
			rownumbers="true" 
			multiselect="false"
			hiddengrid="true"
			navigator="true"
			navigatorAdd="false"
			navigatorSearch="false"
			navigatorEdit="true"
			navigatorDelete="false">

		<sjg:gridColumn name="trail.billSerial" index="trail" title="Bill" sortable="true" key="false"/>
		<sjg:gridColumn name="trackingId" title="Tracking" key="true" hidden="true"/>
		<sjg:gridColumn name="date" index="date" title="Date Added" sortable="true" key="false"/>
		<sjg:gridColumn name="location" index="location" title="Location" sortable="true" key="false"/>
		<sjg:gridColumn name="comment" index="comment" title="Comment" sortable="false" key="false"/>
	</sjg:grid>
</body>
</html>