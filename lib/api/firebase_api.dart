import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notificationapp/main.dart';

class FirebaseApi {
  // create a instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notifications
  Future<void> initNotifications() async {
    // request permission to send notifications
    await _firebaseMessaging.requestPermission();

    // fetch the FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    // print the token to the console
    print("FCM Token: $fCMToken");

    // initialize further settings for push notifications
    initPushNotifications();
  }

  // function to handle received messages
  void handleMessage(RemoteMessage? message) {
    // if the message is null, do nothing
    if (message == null) return;

    // TODO: CRIAR INTEGRAÇÃO PARA LEVAR O USUÁRIO ATÉ A PÁGINA RECEBIDA PELO BACKEND
    navigatorKey.currentState?.pushNamed('/notifications', arguments: message);
  }

  // function to initialize foreground and background messages
  Future initPushNotifications() async {
    // handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // handle notification when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleMessage(message);
    });

    // attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
