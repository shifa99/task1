import 'package:flutter/material.dart';
import 'package:task1/Data/APIData.dart';
import 'package:task1/Models/Adaptive.dart';
import 'package:toast/toast.dart';

class NotificationScreen extends StatefulWidget {
  static final String routeName = 'Notification_screen';
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String title;
  String message;
  APIData _apiData = APIData();
  final formKey = GlobalKey<FormState>();
  void checkValues(BuildContext ctx, String id) {
    if (formKey.currentState.validate()) {
      Toast.show(
        'Done',
        ctx,
        duration: 2,
      );
      _apiData.sendDataToAPI(id, title, message);
    } else {
      Toast.show(
        'Please Enter Data to send it',
        ctx,
        duration: 2,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = getSize(context);
    final id = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: Text('Notification'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Title*',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                  validator: (title) {
                    if (title.isEmpty) return 'Please Enter Title';
                    return null;
                  },
                  onSaved: (tit) {
                    title = tit;
                  },
                  onChanged: (tit) {
                    title = tit;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Message*',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                  validator: (msg) {
                    if (msg.isEmpty) return 'Please Enter message';
                    return null;
                  },
                  onSaved: (msg) {
                    message = msg;
                  },
                  onChanged: (msg) {
                    message = msg;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Color(0xff20124F),
                  onPressed: () {
                    checkValues(context, id);
                    print('send');
                    print(message + ' ' + title);
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
