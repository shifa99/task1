import 'package:flutter/material.dart';
import 'package:task1/Screens/HomeScreen.dart';
import 'package:task1/Screens/Notification.dart';
import 'package:task1/Screens/ProfileNotificationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        NotificationScreen.routeName: (context) => NotificationScreen(),
        ProfileNotificationScreen.routeName: (context) =>
            ProfileNotificationScreen()
      },
      home: HomeScreen(),
    );
  }
}
