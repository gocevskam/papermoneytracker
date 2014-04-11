function getRates() {
	var API = "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-sdmx.xml";
	
	alert('DURING');
	$getJSON(API + key);

	if (json.status == 'ZERO_RESULTS') {
		alert('Wrong input');
	} else {
		var result = {};
		result["timestamp"] = json.results.timestamp;
		result["EUR"] = json.results.rates.EUR();
		alert("Result = " + result);
		return result;
	}
}