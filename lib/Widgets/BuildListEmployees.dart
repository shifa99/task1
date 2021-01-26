import 'package:flutter/material.dart';
import 'package:task1/Models/Adaptive.dart';
import 'package:task1/Models/DetailsEmployee.dart';
import 'package:task1/Widgets/BuildEmployeeStatus.dart';

class BuildListEmployees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height * 0.8 - getSize(context)),
      child: ListView.builder(
          itemCount: employeesData.length,
          itemBuilder: (ctx, i) {
            return BuildEmployeeStatus(
              employee: employeesData[i],
            );
          }),
    );
  }
}
