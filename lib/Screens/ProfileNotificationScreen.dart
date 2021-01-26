import 'package:flutter/material.dart';
import 'package:task1/Models/Employee.dart';
import 'package:task1/Widgets/BuildListOfNotification.dart';
import 'package:task1/Widgets/BuildNotificationPart1.dart';

class ProfileNotificationScreen extends StatelessWidget {
  static String routeName = 'ProfileNotification';
  @override
  Widget build(BuildContext context) {
    final employee = ModalRoute.of(context).settings.arguments as Employee;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Column(children: [
        BuildNotificationPart1(employee),
        BuildListOfNotification(employee.id),
      ]),
    );
  }
}
