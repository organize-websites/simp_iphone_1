import 'package:onesignal_flutter/onesignal_flutter.dart';

class BlocHome{

  Future<void> initOneSignal() async {
    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };
    await OneSignal.shared.init("f23a7bb4-e910-4230-8b8c-530d50587cb7", iOSSettings: settings);
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) async {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
    
    OneSignal.shared.promptUserForPushNotificationPermission();


if (status.permissionStatus.hasPrompted)
  // we know that the user was prompted for push permission
  
if (status.permissionStatus.status == OSNotificationPermission.notDetermined)
  // boolean telling you if the user enabled notifications

if (status.subscriptionStatus.subscribed)
  // boolean telling you if the user is subscribed with OneSignal's backend

// the user's ID with OneSignal
String onesignalUserId = status.subscriptionStatus.userId;

// the user's APNS or FCM/GCM push token
String token = status.subscriptionStatus.pushToken;

String emailPlayerId = status.emailSubscriptionStatus.emailUserId;
String emailAddress = status.emailSubscriptionStatus.emailAddress;


  }


}