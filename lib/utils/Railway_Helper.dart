import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Railway/model/Railway_model.dart';

class ApiHelper {
  Future<List> RailwayApiCall() async {
    List<dynamic> list = [];
    String apiLink = "https://trains.p.rapidapi.com/";
    Uri uri = Uri.parse(apiLink);
    Map m1 = {"search": "Rajdhani"};
    var json = jsonEncode(m1);

    var response = await http.post(
      uri,
      headers: {
        "content-type": "application/json",
        "X-RapidAPI-Key": "891ebeaadfmshcdb75ddf0e11d14p18d866jsn01058ac4fde1",
        "X-RapidAPI-Host": "trains.p.rapidapi.com00000000000000000000"
      },
      body: json,
    );
    var jjson = jsonDecode(response.body);
    List<RailwayModal> apiModalList =
        jjson.map((e) => RailwayModal.fromJson(e)).toList();
    list = apiModalList;
    return list;
  }
}
