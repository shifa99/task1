import 'package:flutter/material.dart';
import 'package:task1/Data/APIData.dart';
import 'package:task1/Models/Adaptive.dart';
import 'package:task1/Models/NotificationBody.dart';
import 'package:intl/intl.dart';

class BuildListOfNotification extends StatelessWidget {
  final String id;
  BuildListOfNotification(this.id);
  @override
  Widget build(BuildContext context) {
    APIData apiData = APIData();
    return FutureBuilder<List<NotificationBody>>(
      future: apiData.getNotifications(id),
      builder: (ctx, snapShot) {
        if (ConnectionState.waiting == snapShot.connectionState)
          return CircularProgressIndicator();
        else {
          if (!snapShot.hasError) {
            if (snapShot.data.isEmpty)
              return Center(
                  child: Text(
                'Nothing Now',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ));
            else
              return Container(
                height:
                    MediaQuery.of(context).size.height * 0.8 - getSize(context),
                child: ListView.builder(
                  itemCount: snapShot.data.length,
                  itemBuilder: (ctx, i) => Container(
                    height: MediaQuery.of(context).size.height * 0.2 -
                        getSize(context),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 95,
                          child: Image.asset(
                            'images/LOGO.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'From: Automatic',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 68,
                                  ),
                                  Text(
                                    DateFormat('d MMM y').format(
                                        DateTime.parse(snapShot.data[i].date)),
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                ],
                              ),
                              Text(snapShot.data[i].title),
                              Text(snapShot.data[i].msg),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
          } else
            return Center(
              child: Text('Error In Internet Connecation'),
            );
        }
      },
    );
  }
}
