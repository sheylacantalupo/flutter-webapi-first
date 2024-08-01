import 'dart:convert';

import 'package:http/http.dart' as http;

class JournalService {
  static const String url = "http://192.168.1.16:3000/";
  static const String resource = "learnhttp";

  String getUrl() {
    return "$url$resource";
  }

  Future<void> register(String content) async {
    final response = await http.post(
      Uri.parse(getUrl()),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "content": content,
      }),
    );

    if (response.statusCode == 201) {
      // Successfully created
      print('Successfully created');
    } else {
      // Error occurred
      print('Failed to add entry: ${response.statusCode}');
    }
  }

  Future<String> get() async{
    http.Response response = await http.get(Uri.parse(getUrl()));
    print(response.body);
    return response.body;
  }
}