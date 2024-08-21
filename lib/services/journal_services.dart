import 'dart:convert';

import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class JournalService {
  static const String url = "http://192.168.1.16:3000/";
  static const String resource = "journals/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());
    http.Response response = await client.post(
      Uri.parse(getUrl()),
      body: jsonJournal,
      headers: {
        'Content-type': 'application/json'
      },
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Journal>> getAll() async {
    http.Response response = await client.get(Uri.parse(getUrl()));
    if(response.statusCode != 200){
      throw Exception();
    }
    List<Journal> list = [];
    List<dynamic> listDynamic = json.decode(response.body);
    for(var jsonMap in listDynamic){
      list.add(Journal.fromMap(jsonMap));
    }
    print(list.length);
    return list;
  }
}
