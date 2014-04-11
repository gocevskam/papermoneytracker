var map;
var markers = {};
var newMarkerId = 0;
var lines = {};
var newLineId = 0;
var counter = 0;
var previousMarkerId = null;
var doOneTime = false;
var result;
var elements = Array();

function initialize() {
	var mapOptions = {
		zoom : 2,
		center : new google.maps.LatLng(0, 0),
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	
	google.maps.event.addListener(map, 'idle',
			function(event) {
				if (!doOneTime) {
					createTrailTableAndShowTrails();
					doOneTime = true;
				}
			});
}

/**
 * Callback to draw markers and trail lines.
 */
function callback(position, trailData) {
	if(previousMarkerId == null) {
		previousMarkerId = placeMarker(position, trailData);
	} else {
		var currentMarkerId = placeMarker(position, trailData);
		drawLine(currentMarkerId, previousMarkerId);
		previousMarkerId = currentMarkerId;
	}
	
}

/**
 * Shows the trail on the map and create the table of trackings accordingly.
 */
function createTrailTableAndShowTrails() {
	var rawJson = document.getElementById("trailJson").innerHTML;
	var trailData = JSON.parse(rawJson);
	for (var i = 0; i < trailData.length; i++) {
		elements.push(trailData[i]);
		
		// graphical stuff
		setTimeout(function() {geocodeAddress();}, 300 * i);

		// table stuff
		var table = document.getElementById("trailTable");
		var row = table.insertRow(-1);
		
		var index = row.insertCell(0);
		var date = row.insertCell(1);
		var location = row.insertCell(2);
		var comment = row.insertCell(3);
		var votes = row.insertCell(4);
		
		index.innerHTML = trailData[i].trackingId;
		date.innerHTML = trailData[i].date;
		location.innerHTML = trailData[i].location;
		comment.innerHTML = trailData[i].comment;
		votes.innerHTML = trailData[i].votes;
	}
}

/**
 * Places a marker and creates a click event listener for an info window for the marker.
 */
function placeMarker(latLng, trailData) {
	var marker = new google.maps.Marker({
		id : newMarkerId++,
		position : latLng,
		map : map
	});
	markers[newMarkerId] = marker;
	
	google.maps.event.addListener(marker, 'click', function(event) {
		addDetailedInfoWindow(marker, trailData);
	});
	
	return newMarkerId;
}

/**
 * Draws a line between two markers.
 */
function drawLine(sourceId, destinationId) {
	var source = markers[sourceId];
	var destination = markers[destinationId];

	var pathCoordinates = [ source.getPosition(), destination.getPosition() ];

	var line = new google.maps.Polyline({
		id : newLineId++,
		path : pathCoordinates,
		strokeColor : '#FF0000',
		strokeOpacity : 1.0,
		strokeWeight : 2
	});
	line.setMap(map);
	lines[newLineId] = line;
	return newLineId;
}

/**
 * Popups an info window on the clicked marker.
 * This window contains the location, date and currency value (at the date of tracking) of the bill.
 */
function addDetailedInfoWindow(marker, trailData) {
	var infoWindow = new google.maps.InfoWindow({
		content : "<b>" + trailData.location.toString() + "</b><br />" 
				+ "Tracked on: <b>" + trailData.date + "</b>"
	});
	
	infoWindow.open(marker.get('map'), marker);
	
	var currency;
	$.when(getCurrencyInfo(trailData.date)).done(function (a) {
		if (result.indexOf("sample") == -1) {
			currency = "<br />This bill was worth its value <b>" + result
					+ "</b> times in dollars on its date of tracking.";
		} else {
			currency = "<br />No currency information available.";
		}		
		infoWindow.setContent(infoWindow.getContent() + currency);
	});
}

/**
 * Currency look up AJAX call to lookupCurrency action.
 */
function getCurrencyInfo(date) {
	return $.ajax({
		type : "POST",
		url : "lookupCurrency",
		data : "input=" + date,
		success : function(msg) {
			result = msg;
		}
	});
}

/**
 * Geocodes a location address to be able to set a marker on the map.
 */
function geocodeAddress() {
	var trailData = elements.pop();
	var address = trailData.location;
	var geocoder = new google.maps.Geocoder();
	return geocoder.geocode({'address': address}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			map.setCenter(results[0].geometry.location);
			callback(new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng()), trailData);
		} else {
			if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT)
				elements.push(trailData);
		}
	});
}

google.maps.event.addDomListener(window, 'load', initialize);