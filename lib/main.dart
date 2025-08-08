import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notificationapp/api/firebase_api.dart';
import 'package:notificationapp/firebase_options.dart';
import 'package:notificationapp/pages/central_de_servicos_page.dart';
import 'package:notificationapp/pages/events_page.dart';
import 'package:notificationapp/pages/home_page.dart';
import 'package:notificationapp/pages/new_page.dart';
import 'package:notificationapp/pages/notification_page.dart';
import 'package:notificationapp/pages/recon_page.dart';
import 'package:notificationapp/pages/soc_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
      home: HomePage(analytics: analytics),
      navigatorKey: navigatorKey,
      routes: {
        '/home': (context) => HomePage(analytics: analytics),
        '/notifications': (context) => NotificationPage(),
        '/new': (context) => NewPage(analytics: analytics),
        '/service_center': (context) => const CentralDeServicosPage(),
        '/security_center': (context) => const SocPage(),
        '/events': (context) => const EventsPage(),
        '/recon': (context) => const ReconPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
