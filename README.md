# Fuzzy
Blurred wallpaper while notifications exist on iOS 10, the native way.


On iOS 9, the lockscreen wallpaper would blur while notifications were waiting to be dismissed. This was abandoned in iOS 10, although it is very simple to re-implement with the new background style methods.

By hooking the backgroundStyle property of SBDashBoardNotificationListViewController, we can return one of the blurred styles instead of the default no-blur. Ezpz

