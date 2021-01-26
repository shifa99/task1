import 'package:flutter/material.dart';
import 'package:task1/Widgets/BuildListEmployees.dart';
import 'package:task1/Widgets/BuildSearch.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Employees'),
      centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BuildSearch(),
          DefaultTabController(
            length: 2,
            child: TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              controller: tabController,
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Subordinate',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [BuildListEmployees(), Text('Managers')]),
          )
          //BuildListEmployees()
        ],
      ),
    );
  }
}
