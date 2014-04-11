<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	<style>
		#map-canvas {
			height: 500px;
			width: 900px;
			margin: 20px auto;
		}

		.gm-style img {
			max-width: none;
		}

		.gm-style label {
			width: auto;
			display: inline;
		}

		#input {
			background-color: #fff;
			padding: 0 11px 0 13px;
			width: 400px;
			font-family: Roboto;
			font-size: 15px;
			font-weight: 300;
			text-overflow: ellipsis;
		}

		#input:focus {
			border-color: #4d90fe;
			margin-left: -1px;
			padding-left: 14px; /* Regular padding-left + 1. */
			width: 401px;
		}

		.controls {
			margin-top: 16px;
			border: 1px solid transparent;
			border-radius: 2px 0 0 2px;
			box-sizing: border-box;
			-moz-box-sizing: border-box;
			height: 32px;
			outline: none;
			box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
		}
	</style>

</head>

<div id="map-canvas"></div>

	
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script src="loadGoogleMaps.js"></script>
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
		var inputfield = document.getElementById("input");
		var lat = position.coords.latitude;
		var lng = position.coords.longitude;
		var latLng = new google.maps.LatLng(lat, lng, true);
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({'latLng': latLng}, function(results, status) {
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