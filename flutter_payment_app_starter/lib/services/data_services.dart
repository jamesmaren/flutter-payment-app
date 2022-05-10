import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class DataServices {
  String _baseUsl = 'http://127.0.0.1:8000/api/';

  Future<List<dynamic>> getUsers() async {
    var apiUrl = '/billinfo';

    http.Response response = await http.get(Uri.parse(_baseUsl + apiUrl));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = await json.decode(response.body);
        print(list);
        return list.map((e) => e).toList();
      } else {
        print('something went wrong');
        return [];
      }
    } catch (e) {
      print(e);
      print("Api request failed");
      return [];
    }

    // var info = rootBundle.loadString("json/data.json");
    // List<dynamic> list = json.decode(await info);
    // return Future.delayed(
    //     Duration(seconds: 5), () => list.map((e) => e).toList());
  }
}
