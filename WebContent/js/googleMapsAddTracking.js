var map;

function initialize() {
	var mapOptions = {
		zoom : 2,
		center : new google.maps.LatLng(0, 0),
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

	var input = document.getElementById('location');
	
	var autocomplete = new google.maps.places.Autocomplete(input);
	autocomplete.bindTo('bounds', map);

	google.maps.event.addListener(autocomplete, 'place_changed', function(event) {
		var place = autocomplete.getPlace();
		map.setCenter(place.geometry.location);
		map.setZoom(11); // "Because it looks good." - Google 2011
	});

}

google.maps.event.addDomListener(window, 'load', initialize);