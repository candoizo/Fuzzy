#define kPrefsAppID 					CFSTR("ca.ndoizo.sigh")
#define kSettingsChangedNotification 	CFSTR("ca.ndoizo.sigh.changed")

static int style;

static void loadPreferences() {
  CFPreferencesAppSynchronize(kPrefsAppID);
  style = !CFPreferencesCopyAppValue(CFSTR("style"), kPrefsAppID) ? 3 : [CFBridgingRelease(CFPreferencesCopyAppValue(CFSTR("style"), kPrefsAppID)) intValue];
}

static void prefsCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
  loadPreferences();
}

%hook SBDashBoardNotificationListViewController
-(long long)backgroundStyle { return style ? style : %orig;}
%end

%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)arg1 {%orig; loadPreferences();} //lol i was high when i wrote this and now i remember this could/should be in the ctor ayy, but in the grand scheme i dont see it mattering
%end

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
		 	NULL,
		 	(CFNotificationCallback)prefsCallback,
		 	kSettingsChangedNotification,
		 	NULL,
		 	CFNotificationSuspensionBehaviorDeliverImmediately
		 );
}
