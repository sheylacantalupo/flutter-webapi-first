import 'dart:convert';

import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class JournalService {
  static const String url = "http://192.168.1.16:3000/";
  static const String resource = "learnhttp";

  http.Client client = InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  Future<void> register(String content) async {
    final response = await client.post(
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
    http.Response response = await client.get(Uri.parse(getUrl()));
    print(response.body);
    return response.body;
  }
}