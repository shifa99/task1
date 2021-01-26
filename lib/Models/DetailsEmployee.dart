import 'package:task1/Models/Employee.dart';

int cnt = 0;
List<Employee> employeesData = [
  Employee(name: 'abdulla sherbiny', attend: true, id: (cnt++).toString()),
  Employee(
      name: 'adham adham',
      attend: false,
      id: (cnt++).toString(),
      position: 'Project manager/ Business analyst',
      branch: 'maadi'),
  Employee(
      name: 'ahmed Aki',
      attend: false,
      id: (cnt++).toString(),
      position: 'UNIX Admin',
      branch: 'maadi'),
  Employee(name: 'ahmed1 mohamed', attend: true, id: (cnt++).toString()),
  Employee(
      name: 'ehab mohamed',
      attend: true,
      id: (cnt++).toString(),
      position: 'Software Developer'),
  Employee(
      name: 'esraa mohamed mohamed',
      attend: false,
      id: (cnt++).toString(),
      branch: 'dokki branch'),
  Employee(name: 'hala mohamed', attend: false, id: (cnt++).toString()),
  Employee(
      name: 'hanah tester',
      attend: false,
      id: (cnt++).toString(),
      position: 'Software Developer'),
];
