module("browsersettings");

if (forge.is.ios()) {
    asyncTest("Play media inline", 1, function() {              
		$("video" ).remove();	        
		var videoElement = document.createElement("video");
		videoElement.setAttribute("controls", "controls");
		videoElement.setAttribute("webkit-playsinline", true);
		videoElement.setAttribute("width", "100%");
		videoElement.src = forge.inspector.getFixture("browsersettings", "small.mp4").uri;
		document.getElementById("qunit").appendChild(videoElement);
		askQuestion("Did the video below play inline?", {
			Yes: function() {
				ok(true, "success");
				start();
			},
			No: function() {
				ok(false, "failure");
				start();
			}
		});
        
	});
}
asyncTest("Autoplay video", 1, function() {
	$("video" ).remove();	
	var videoElement = document.createElement("video");
	videoElement.setAttribute("webkit-playsinline", true);
	videoElement.setAttribute("autoplay", "autoplay");
	videoElement.setAttribute("width", "100%");
	videoElement.src = forge.inspector.getFixture("browsersettings", "small.mp4").uri;
	document.getElementById("qunit").appendChild(videoElement);
	askQuestion("Did the video play automatically?", {
		Yes: function() {
			ok(true, "success");
			start();
		},
		No: function() {
			ok(false, "failure");
			start();
		}
	});
});

asyncTest("Test accept cookies", 1, function() {
	$("video" ).remove();
	var iframeElement = document.createElement("iframe");
	iframeElement.setAttribute("id", "iframe");
	document.getElementById("qunit").appendChild(iframeElement); 
	$.ajax({
		url: "http://httpbin.org/cookies/set?mainpage_cookie=set_successfully",
		success: function () {
			forge.logging.log("Ajax - set cookie");
		},
		error: function(xhr) {
			forge.logging.log("Ajax error occured: " + xhr.status + " " + xhr.statusText);
		}
	});
	$("#iframe").attr("src", "http://httpbin.org/cookies/set?iframe_cookie=set_successfully");
	askQuestion("Did the mainpage_cookie and the iframe_cookie set successfully?", {
		Yes: function() {
			ok(true, "success");
			start();
		}, 
		No: function() {
			ok(false, "failure");
			start();
		}
	});
});
