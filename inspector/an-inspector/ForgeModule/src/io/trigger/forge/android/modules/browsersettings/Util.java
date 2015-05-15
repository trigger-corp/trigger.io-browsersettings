package io.trigger.forge.android.modules.browsersettings;

import android.os.Build;
import android.webkit.CookieManager;
import io.trigger.forge.android.core.ForgeApp;

public class Util {
	public static void setInlineVideo(boolean forceInlineVideo) {	    
		//not required for android, video plays inline by default	
	}
	public static void setAutoplayVideo(boolean autoplayVideo) {
		ForgeApp.getActivity().webView.getSettings().setMediaPlaybackRequiresUserGesture(!autoplayVideo);
	}
	public static void setAcceptCookies(boolean acceptCookies){		
		CookieManager cookieManager = CookieManager.getInstance();
		cookieManager.setAcceptCookie(acceptCookies);
		if (Build.VERSION.SDK_INT >= 21 /* Build.VERSION_CODES.LOLLIPOP */) {
			cookieManager.setAcceptThirdPartyCookies(ForgeApp.getActivity().webView, acceptCookies);
		}
		
	}
}
