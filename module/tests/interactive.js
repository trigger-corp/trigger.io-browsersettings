/* global module, $, forge, asyncTest, askQuestion, ok, start */

module("browsersettings");


asyncTest("Test html5 audio", 1, function() {
    var audioElement = document.createElement("audio");
    audioElement.src = forge.inspector.getFixture("browsersettings", "audio.mp3").uri;
    audioElement.controls = true;
    document.getElementById("qunit").appendChild(audioElement);
    askQuestion("Could you hear audio when you hit play?", {
        Yes: function() {
            $("audio").remove();
            ok(true, "success");
            start();
        },
        No: function() {
            $("audio").remove();
            ok(false, "failure");
            start();
        }
    });
});


if (forge.is.ios()) {
    asyncTest("Play media inline", 1, function() {
        $("video" ).remove();
        var videoElement = document.createElement("video");
        videoElement.setAttribute("controls", "controls");
        videoElement.setAttribute("playsinline", true);
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
    videoElement.setAttribute("playsinline", true);
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
    $("video").remove();

    var iframeElement = document.createElement("iframe");
    iframeElement.setAttribute("id", "iframe");
    document.getElementById("qunit").appendChild(iframeElement);

    $.ajax({
        url: "https://httpbin.org/cookies/set?mainpage_cookie=set_successfully",
        success: function (response) {
            forge.logging.log("Ajax - set cookie: " + JSON.stringify(response));
            $("#iframe").attr("sandbox", "allow-storage-access-by-user-activation allow-scripts allow-same-origin");
            $("#iframe").attr("src", "https://httpbin.org/cookies/set?iframe_cookie=set_successfully");
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
        },
        error: function(xhr) {
            forge.logging.log("Ajax error occured: " + xhr.status + " " + xhr.statusText);
        }
    });
});
