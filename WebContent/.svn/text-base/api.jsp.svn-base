<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Bill API</title>	
</head>

<body>
	<div id="titleSpace">
		<jsp:include page="templates/header.jsp" />
	</div>

	<div class="featured">
		<div class="heading">
			<h2>Bill API</h2>
		</div>
		<div class ="content">
			<article>
				The Bill API is a Restful API which allows you to search for Euro bills in our database.
				If the bill you search for is in our database, you will get back information about the bill 
				such as the worth of the bill and the list of locations where the bill has been tracked.
				The API works by making requests via URLs, which is demonstrated below. The API returns JSON.
				
				<br/><br/><br/><br/>
				
				<h3>Getting Bills</h3><br/>
				To retrieve bill data from the database, you can use next URL: <br/><br/>
				<code>http://localhost:8080/papermoneytracker/rest/trail/Z11111111118</code>
				<br/><br/>
				Where Z11111111118 is the serial number of the bill you are searching for. The request is made on "../trail/", 
				this because the trail of a bill is directly linked to that bill. They have a one-to-one relation.
				The previous request will result in this reponse: <br/><br/>
				<samp>
				{"request":["successful","","Mon Dec 09 19:30:15 CET 2013"],<br/>
 				"serial":"Z11111111118",<br/>
 				"trail":[["98304","Antwerp"],["163840","Brussel"],["196608","Ghent"]],<br/>
			 	"value":50,<br/>
 				"votes":24}
				</samp>
				<br/><br/>
				In the trail variable there is a list of all trackings on that trail. In this example there are three trackings.
				Only the ID of the tracking and the location are mentioned here. If you want more information about a tracking
				you can look it up by preforming a next request with the tracking ID.
				<br/><br/><br/><br/>
				
				<h3>Getting Trackings</h3><br/>
				To retrieve tracking data from the database, you can use next URL: <br/><br/>
				<code>http://localhost:8080/papermoneytracker/rest/tracking/98304</code>
				<br/><br/>
				Where 98304 is the ID of the tracking you are searching for.
				This request will result in this reponse: <br/><br/>
				<samp>
				{"request":["successful","","Tue Dec 10 00:30:06 CET 2013"],<br/>
 					"belongsTo":"Z11111111118",<br/>
 					"trackedBy":"Jonas",<br/>
 					"trackedOn":"2013-12-08 18:50:40.16",<br/>
 					"location":"Antwerp",<br/>
 					"comment":"A comment on a tracking",<br/>
 					"trackingID":"98304",<br/>
 					"votes":2}
				</samp>
				<br/><br/><br/><br/>
				
				<h3>Not In Database</h3><br/>
				If any data you are trying to retrieve is not in the database, this will be stated in the request part
				of the returned JSON. As shown here:
				<br/><br/>
				<samp>
				{"request":["failed","serial error : not found in database","Mon Dec 09 19:37:08 CET 2013"], </br>
 					"serial":"F00000000011",<br/>
 					"trail":null,<br/>
 					"value":0,<br/>
 					"votes":0}
				</samp>
				<br/><br/>
			</article>
		</div>
	</div>

	<div id="footerSpace">
		<jsp:include page="templates/footer.jsp" />
	</div>
</body>
</html>