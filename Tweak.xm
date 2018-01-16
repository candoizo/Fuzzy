static NSUserDefaults * prefs = nil;

%ctor {
	prefs = [[NSUserDefaults alloc] initWithSuiteName:@"ca.ndoizo.sigh"];
}

%hook SBDashBoardNotificationListViewController
-(long long)backgroundStyle { return [prefs valueForKey:@"style"] ? [[prefs valueForKey:@"style"] intValue] : %orig;}
%end
