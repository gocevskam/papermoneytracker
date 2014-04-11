// DO NOT REUSE THESE
var map;
var markers = {};
var newMarkerId = 0;

var lines = {};
var newLineId = 0;

// Callback
var previousMarkerId = null;
var doOneTime = false;
var elements = new Array();

function initialize() {
	var mapOptions = {
		zoom : 2,
		center : new google.maps.LatLng(0, 0),
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

	var input = document.getElementById('input');
	
	var autocomplete = new google.maps.places.Autocomplete(input);
	autocomplete.bindTo('bounds', map);

	google.maps.event.addListener(autocomplete, 'place_changed', function(event) {
		var place = autocomplete.getPlace();
		map.setCenter(place.geometry.location);
		map.setZoom(11); // "Because it looks good." - Google 2011
	});
	
	/* Test code */
	google.maps.event.addListener(map, 'idle',
			function(event) {
				if (!doOneTime) {
					showTrails();
					doOneTime = true;
				}
			});
}

function callback(position) {	
	if(previousMarkerId == null) {
		previousMarkerId = placeMarker(position);
	} else {
		var currentMarkerId = placeMarker(position);
		previousMarkerId = currentMarkerId;
	}
}

function showTrails() {
	var rawJson = document.getElementById("trailJson").innerHTML;
	var trailData = JSON.parse(rawJson);
	for (var i = 0; i < trailData.length; i++) {
		elements.push(trailData[i].location);
		// Delay requests to avoid reaching limit per second.
		setTimeout(function() {geocodeAddress();}, 300 * i);
	}
}

function geo() {
	geocodeAddress(element.location);
}

function placeMarker(location) {
	var marker = new google.maps.Marker({
		id : newMarkerId++,
		position : location,
		map : map
	});
	markers[newMarkerId] = marker;
	return newMarkerId;
}

function deleteMarker(id) {
	if (id > 0) {
		var marker = markers[id];
		marker.setMap(null);
		delete markers[id];
	}
}

function addInfoWindow(markerId, text) {
	var marker = markers[markerId];
	var position = marker.getPosition();
	var infoWindow = new google.maps.InfoWindow({
		content : position.lat().toString() + ', ' + position.lng().toString()
				+ '\n' + text.toString()
	});
	google.maps.event.addListener(marker, 'click', function() {
		infoWindow.open(marker.get('map'), marker);
	});
}

function geocodeAddress() {
	var address = elements.pop();
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({'address': address}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			//map.setCenter(results[0].geometry.location);
			callback(new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng()));
		} else {
			if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT)
				elements.push(address);
		}
	});
}

function reverseGeocode(latLng) {
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({'latLng': latLng}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			if (results[1]) {
				var markerId = placeMarker(latLng);
				addInfoWindow(markerId, results[1].formatted_address);
			} else {
				alert('No results found');
			}
		} else {
			alert('Geocoder failed due to ' + status);
		}
	});
}

google.maps.event.addDomListener(window, 'load', initialize);