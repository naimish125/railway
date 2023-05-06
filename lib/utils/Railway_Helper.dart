import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Railway/model/Railway_model.dart';

class ApiHelper {
  Future<RailwayModal?> RailwayApiCall(String train) async {
    String apiLink = "https://trains.p.rapidapi.com/";
    var response = await http.get(Uri.parse(apiLink), headers: {
      "content-type": "application/json",
      "X-RapidAPI-Key": "891ebeaadfmshcdb75ddf0e11d14p18d866jsn01058ac4fde1",
      "X-RapidAPI-Host": "trains.p.rapidapi.com",
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      RailwayModal RModal = RailwayModal.fromJson(json);

      return RModal;
    }
    return null;
    }
}