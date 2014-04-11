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

var flag = document.getElementById("flag");
var flagLabel = document.getElementById("flagLabel");
var valueLabel = document.getElementById("value");
valueLabel.size = 3;

var clicked = false;
var selected = null;

var addButton = document.getElementById("addBill_inDB");
addButton.disabled = true;

function over(img) {
	img.onmouseover = function() {
		if (img != selected || selected == null) {
			img.style.border='2px dotted #000000';
			img.height = img.height*1.3;
			img.width = img.width*1.3;
		}
	};
	
	img.onmouseover.apply(img);
}

function out(img) {
	img.onmouseout = function() {
	if (img != selected || selected == null) {
		img.style.border='0px';
		img.height = img.height/1.3;
		img.width = img.width/1.3;
	}
	};
	
	img.onmouseout.apply(img);
}

function clickk(img) {
	img.onclick = function() {
		if (img != selected && selected != null) {
			img.style.border='3px solid #000000';
			selected.style.border='0px';
			selected.height = selected.height/1.3;
			selected.width = selected.width/1.3;
			selected = img;
			clicked = true;
		} else {
			img.style.border='3px solid #000000';
			selected = img;
			clicked = true;
		}
	};
	valueLabel.value = img.id;
	img.onclick.apply(img);
}



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
	if (serial.length == SERIAL_LENGTH) {
		var letter = serial.charAt(0);
		var numbers = serial.substring(1, SERIAL_LENGTH);
		var checksum = serialData[letter][1];	
		var checkSerial = isChecksumCorrect(numbers, checksum);
		if (checkSerial) {	
			textField.style.backgroundColor = "#0FFF00";
			addButton.disabled = false;
			var country = serialData[letter][0];
			flagLabel.innerHTML = "this bill was produced by " + country;
			flag.src = "images/flags/48/" + country + ".png";
			return;
		}
	}
	textField.style.backgroundColor = "#FF1919";
	addButton.disabled = true;
	flagLabel.innerHTML = "";
	flag.src = "";
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

validateSerial(serialTextField);