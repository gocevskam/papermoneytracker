// CONSTANTS

var top3 = null;
var ran6 = null;

/**
 * AJAX call to the server to get JSON of trackings and votes to use in the web page.
 * (see AjaxAction.java)
 */
function setupPage() {
	$.ajax({
		type : "post",
		url : "ajaxGetTop3AndRandom", // java action
		data : "input=" + "foo" + "&output=" + $('#op').val(),
		success : function(msg) {
			// msg is JSON string with &quot;'s
			var data = JSON.parse(msg.replace(/&quot;/ig,'"'));
	
			// Array with top 3 trackings.
			var top = data.data[0];
			// Array with 6 random trackings.
			var ran = data.data[1];
			
			$('#1v').append(top[2].votes + " votes");
			$('#1comment').append(top[2].comment);
			$('#1extra').append(" - by " + top[2].trackedby.username + ", " + top[2].location);
			$('#2v').append(top[1].votes + " votes");
			$('#2comment').append(top[1].comment);
			$('#2extra').append(" - by " + top[1].trackedby.username + ", " + top[1].location);
			$('#3v').append(top[0].votes + " votes");
			$('#3comment').append(top[0].comment);
			$('#3extra').append(" - by " + top[0].trackedby.username + ", " + top[0].location);
			
			for (var i = 1; i < 7; i++) {
				$('#'+i+'rv').append(ran[i-1].votes + " votes");
				$('#'+i+'rcomment').append(ran[i-1].comment);
				$('#'+i+'rextra').append(" - by " + ran[i-1].trackedby.username + ", " + ran[i-1].location);
			}
			
			top3 = top;
			ran6 = ran;
		}
	});
}

function vote(rID) {
	var trackingID = null;
	jQuery.each(ran6, function(index, item) {
		if (index+1 == rID) {
			trackingID = item.trackingId;
		}
	});
		
	if (trackingID != null) {
		$.when(ajaxVote(trackingID, rID)).done(function(av) {
			$.ajax({
				type : "post",
				url : "ajaxGetTop3AndRandom", // java action
				data : "input=" + "foo" + "&output=" + $('#op').val(),
				success : function(msg) {
					// msg is JSON string with &quot;'s
					var data = JSON.parse(msg.replace(/&quot;/ig,'"'));
			
					// Array with top 3 trackings.
					var top = data.data[0];
					
					$('#1v').empty().append(top[2].votes + " votes");
					$('#1comment').empty().append(top[2].comment);
					$('#1extra').empty().append(" - by " + top[2].trackedby.username + ", " + top[2].location);
					$('#2v').empty().append(top[1].votes + " votes");
					$('#2comment').empty().append(top[1].comment);
					$('#2extra').empty().append(" - by " + top[1].trackedby.username + ", " + top[1].location);
					$('#3v').empty().append(top[0].votes + " votes");
					$('#3comment').empty().append(top[0].comment);
					$('#3extra').empty().append(" - by " + top[0].trackedby.username + ", " + top[0].location);
					
					top3 = top;
				}
			});			
		});
	}
}

function ajaxVote(trackingID, rID) {
	return $.ajax({
		type : "post",
		url : "ajaxVoteForTracking", // java action
		data : "input=" + trackingID + "&output=" + $('#op').val(),
		success : function(msg) {
			if ($.trim(msg) == "no") {
				$('#link'+rID).empty();
				$('#link'+rID).append("Voted yet.");
			} else {
				$('#'+rID+'rv').empty();
				$('#'+rID+'rv').append(msg + " votes");
				$('#link'+rID).empty();
				$('#link'+rID).append("Voted.");
			}
		}
	});
}

setupPage();