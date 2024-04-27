import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_send_notifications/main.dart';
import 'package:firebase_send_notifications/screens/notification_screen.dart';

class FirebaseAPI {
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState
        ?.pushNamed(NotificationScreen.route, arguments: message);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("fcmToken");
    print(fcmToken);

    initPushNotifications();
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Titulo ${message.notification?.title}');
  print('Titulo ${message.notification?.body}');
}
