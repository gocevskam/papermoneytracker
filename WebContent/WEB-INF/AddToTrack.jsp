<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
#map-canvas {
	height: 300px;
	width: 480px;
	margin: 10px 10px 10px 10px;
}

.gm-style img {
	max-width: none;
}

.gm-style label {
	width: auto;
	display: inline;
}
</style>
<title>Add location</title>
</head>
<body>
	<div id="titleSpace">
		<jsp:include page="../templates/header.jsp" />
	</div>
	<div class="featured">
		<h2>Leave your mark!</h2>
		<div class="content">
			<input id="locationButton" type="submit" value="Current" />

			<s:form action="addTracking.action" method="post">
				<s:textfield id="serialTextField" label="Serial Number"
					key="billSerial" value="%{billSerial}" readonly="true" />
				<tr>
					<td class="tdLabel"><img id="flag" /></td>
					<td class="tdLabel"><label id="flagLabel" for="flag"
						class="label"></label></td>
				</tr>
				<tr>
					<td class="tdLabel"><label id="valueLabel" for="value"
						class="label">Bill Value: </label></td>
					<td class="tdLabel"><label id="worth"></label></td>
				</tr>
				<tr>
					<td colspan="2">.</td>
				</tr>
				<s:textfield id="location" label="Location" key="location" />
				<tr>
					<td></td>
					<td><div id="map-canvas"></div></td>
				</tr>
				<s:textarea cols="20" label="How did you get the bill?"
					name="comment" id="note" key="comment">
				</s:textarea>
				<s:submit id="addBill_inDB" value="Add Location" />
				<tr>
					<td><s:if test="hasActionErrors()">
							<div class="errors">
								<s:actionerror />
							</div>
						</s:if></td>
				</tr>
			</s:form>
		</div>
	</div>

	<div id="footerSpace">
		<jsp:include page="../templates/footer.jsp" />
	</div>

	<script src="js/addLocation.js"></script>
	<script type="text/javascript">
		var button = document.getElementById("locationButton");
		button.addEventListener("click", function() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showPosition);
			} else {
				alert("Geolocation is not supported.");
			}
		});

		function showPosition(position) {
			var inputfield = document.getElementById("location");
			var lat = position.coords.latitude;
			var lng = position.coords.longitude;
			var latLng = new google.maps.LatLng(lat, lng, true);
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({
				'latLng' : latLng
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					if (results[1]) {
						inputfield.value = results[1].formatted_address;
					} else {
						alert('No results found');
					}
				} else {
					alert('Geocoder failed due to ' + status);
				}
			});
		}
	</script>

</body>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script src="js/googleMapsAddTracking.js"></script>
</html>