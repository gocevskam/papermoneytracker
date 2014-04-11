/**
 * Constants.
 */
const SERIAL_LENGTH = 12;

//Initialization
var serialTextField = document.getElementById("serialTextField");
serialTextField.onkeyup = function() {
	validateSerial(serialTextField);
};
serialTextField.autocomplete = "off";
serialTextField.size = SERIAL_LENGTH;
serialTextField.maxLength = SERIAL_LENGTH;	

var flag = document.getElementById("flagIndex");
var flagLabel = document.getElementById("flagLabelIndex");

var showButton = document.getElementById("showTraill");
showButton.disabled = true;
var addButton = document.getElementById("addBill");
addButton.disabled = true;
var addLocButton = document.getElementById("addLocation");
addLocButton.disabled = true;

var tracked = false;

/**
 * Dictionary for all bill serial checksums.
 * Format: <first letter in serial>: [<country>,<checksum>]
 */
var serialData = {
    'Z': ["Belgium",9],
    'Y': ["Greece",1],
    'X': ["Germany", 2],
    'V': ["Spain", 4],
    'U': ["France", 5],
    'T': ["Ireland", 6],
    'S': ["Italy", 7],
    'R': ["Luxembourg", 8],
    'P': ["Netherlands", 1],
    'N': ["Austria", 3],
    'M': ["Portugal", 4],
    'L': ["Finland", 5],
    'H': ["Slovenia", 9],
    'G': ["Cyprus", 1],
    'F': ["Malta", 2],
    'E': ["Slovakia", 3],
    'D': ["Estonia", 4]
};

/**
 * Validates a bill serial which was input to a given text field.
 */
function validateSerial(textField) {
	var serial = textField.value;
	addButton.disabled = true;
	addLocButton.disabled = true;
	showButton.disabled = true;
	if (serial.length == SERIAL_LENGTH) {
		var letter = serial.charAt(0);
		var numbers = serial.substring(1, SERIAL_LENGTH);
		var checksum = serialData[letter][1];	
		var checkSerial = isChecksumCorrect(numbers, checksum);
		if (checkSerial) {	
			textField.style.backgroundColor = "#0FFF00";
			
			var country = serialData[letter][0];
			flagLabelIndex.innerHTML = "Country of production: " + country;
			flagIndex.src = "images/flags/48/" + country + ".png";
			
			// AJAX search if bill is tracked yet or not
			trackedOrNot(serial);
			inDBtext.innerHTML = "Is this bill in our database yet?";
									
			return;
		}
	}
	textField.style.backgroundColor = "#FF1919";
	flagLabel.innerHTML = "";
	flag.src = "";
	inDBtext.innerHTML = "";
	$('#trackedOrNot').empty();
}

/**
 * Check if the given checksum is digital root of the given code.
 */
function isChecksumCorrect(code, checksum) {
	var correct = false;
	// compute sum of numbers
	var sum = 0;
	for (var i = 0; i < code.length; i++) {
		sum += parseInt(code.charAt(i));
	}
	var newSum = sum.toString();
	
	// check if needs to be computed again
	if (newSum.length == 1) {
		var intNewSum = parseInt(newSum);
		if (intNewSum == checksum) {
			correct = true;
		} else {
			correct = false;
		}
	} else {
		correct = isChecksumCorrect(newSum, checksum);
	}
	
	return correct;
}

/**
 * AJAX call to the server to check whether the serial is already tracked in the database or not.
 * (see AjaxAction.java)
 */
function trackedOrNot(serial) {
	$.ajax({
		type : "post",
		url : "ajaxBillSerialDBCheck", // java action
		data : "input=" + serial + "&output=" + $('#op').val(),
		success : function(msg) {
			if (msg == "Yes")
				tracked = true;
			else 
				tracked = false;
			$('#trackedOrNot').empty();
			$('#trackedOrNot').append(msg);
			
			var loggedIn = addButton.title == "" && addLocButton.title == "";
			if (loggedIn && tracked) {
				showButton.disabled = false;
				addLocButton.disabled = false;
			} else if (loggedIn && !tracked){
				addButton.disabled = false;
			} else if (!loggedIn && tracked) {
				showButton.disabled = false;
			}
		}
	});
}

validateSerial(serialTextField);