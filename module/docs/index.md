``browsersettings``: Platform-agnostic browser config
=====================================================

accept cookies
:	set to true to set the application's cookie policy to accept cookies.

###Media Playback

inline video
:	set this to `true` to enable inline video playback. The `<video>` element in the HTML document must also include the 'webkit-playsinline' attribute (iOS only).

require user action
:	set this to `true` to require the user to press 'play'. If set to `false`, ensure the `<audio>` or `<video>` element you want to play has the `autoplay` attribute set.

enable html5 audio
:   set this to `true` to enable HTML5 <audio> tag playback in the iOS webview. (iOS only)

enable background audio
:   set this to `true` to allow audio in the iOS webview to play even when the app is running in the background. (iOS only)

respect playing audio
:   set this to `true` to prevent audio being played by other apps from being muted when your app starts. (iOS only)
