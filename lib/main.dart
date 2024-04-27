import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_send_notifications/firebase_api.dart';
import 'package:firebase_send_notifications/firebase_options.dart';
import 'package:firebase_send_notifications/screens/home_screen.dart';
import 'package:firebase_send_notifications/screens/notification_screen.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAPI().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        NotificationScreen.route: (context) => const NotificationScreen()
      },
    );
  }
}
