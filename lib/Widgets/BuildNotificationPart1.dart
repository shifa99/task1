import 'package:flutter/material.dart';
import 'package:task1/Data/APIData.dart';
import 'package:task1/Models/Adaptive.dart';
import 'package:task1/Models/Employee.dart';

class BuildNotificationPart1 extends StatelessWidget {
  final KStyle = TextStyle(fontSize: 18, color: Colors.black);
  final Employee employee;
  BuildNotificationPart1(this.employee);
  @override
  Widget build(BuildContext context) {
    final employee = ModalRoute.of(context).settings.arguments as Employee;
    APIData apiData = APIData();
    apiData.getNotifications(employee.id);
    return Container(
      height: MediaQuery.of(context).size.height * 0.2 - getSize(context),
      padding: EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 5),
      color: Color(0xffE9E9E9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 95,
              child: Image.asset(
                'images/employee.png',
                fit: BoxFit.contain,
              )),
          SizedBox(
            width: 7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(employee.name, style: KStyle),
              Text(
                employee.position ?? '',
                style: KStyle,
              ),
              Text(
                'id: ${employee.id}',
                style: KStyle,
              ),
              employee.branch != null
                  ? Text(
                      'branch: ${employee.branch}',
                      style: KStyle,
                    )
                  : Text(''),
            ],
          )
        ],
      ),
    );
  }
}
