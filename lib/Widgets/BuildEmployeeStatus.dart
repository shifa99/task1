import 'package:flutter/material.dart';
import 'package:task1/Models/Employee.dart';
import 'package:task1/Screens/Notification.dart';
import 'package:task1/Screens/ProfileNotificationScreen.dart';

class BuildEmployeeStatus extends StatefulWidget {
  // final String name;
  // final String image;
  // final bool attend;
  // final String position;
  // final String branch;
  final Employee employee;
  BuildEmployeeStatus({this.employee});
  @override
  _BuildEmployeeStatusState createState() => _BuildEmployeeStatusState();
}

class _BuildEmployeeStatusState extends State<BuildEmployeeStatus> {
  bool more = true;
  @override
  Widget build(BuildContext context) {
    print('rebuald');
    return Container(
      margin: EdgeInsets.only(left: 15, right: 10),
      child: Column(children: [
        ListTile(
          leading: Container(
            child: Image.asset(
              'images/employee.png',
              fit: BoxFit.cover,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              widget.employee.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
              ),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.employee.position != null
                    ? widget.employee.position
                    : '',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Text(widget.employee.branch != null ? widget.employee.branch : '',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
          trailing: FittedBox(
            fit: BoxFit.cover,
            child: Column(
              children: [
                widget.employee.attend == false
                    ? Text(
                        'Absent',
                        style: TextStyle(
                            color: Colors.redAccent[700], fontSize: 22),
                      )
                    : Text(
                        'Present',
                        style: TextStyle(color: Colors.green, fontSize: 22),
                      ),
                FlatButton(
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () {
                      setState(() {
                        more = more ? false : true;
                      });
                    },
                    child: Icon(more ? Icons.expand_more : Icons.expand_less)),
                if (!more)
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.notification_important,
                              color: Colors.green,
                              size: 50,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, NotificationScreen.routeName,
                                  arguments: widget.employee.id);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.person,
                              color: Colors.cyan,
                              size: 50,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ProfileNotificationScreen.routeName,
                                  arguments: widget.employee);
                            }),
                      ]),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          color: Colors.black,
        ),
      ]),
    );
  }
}
