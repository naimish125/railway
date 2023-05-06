import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Railway/model/Railway_model.dart';

class ApiHelper {
  Future<HomeModal?> coronaApiCall(String train) async {
    String apiLink = "https://rapidapi.com/navii/api/railway-trains-${train}/";
    var response = await http.get(Uri.parse(apiLink), headers: {
      "content-type": "application/json",
      "X-RapidAPI-Key": "891ebeaadfmshcdb75ddf0e11d14p18d866jsn01058ac4fde1",
      "X-RapidAPI-Host": "trains.p.rapidapi.com",
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      HomeModal homeModal = HomeModal.fromJson(json);

      return homeModal;
    }
    return null;
    }
}