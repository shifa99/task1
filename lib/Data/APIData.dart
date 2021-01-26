import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task1/Models/NotificationBody.dart';

class APIData {
  void sendDataToAPI(String id, String title, String msg) async {
    String url =
        'https://fcmpractice-58773-default-rtdb.firebaseio.com/${id}.json';

    await http.post(url,
        body: jsonEncode({
          'title': title,
          'message': msg,
          'date': DateTime.now().toIso8601String()
        }));
    print('Done');
  }

  Future<List<NotificationBody>> getNotifications(String id) async {
    String url =
        'https://fcmpractice-58773-default-rtdb.firebaseio.com/${id}.json';
    final response = await http.get(url);
    List<NotificationBody> notifiBody = [];
    final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
    if (extractedData != null)
      extractedData.forEach((key, value) {
        notifiBody.add(NotificationBody(
            title: value['title'], msg: value['message'], date: value['date']));
      });
    // print(response.body);
    return notifiBody;
  }
}
