import 'package:flutter/material.dart';
import 'package:railway/utils/Railway_Helper.dart';

class RailwayProvider extends ChangeNotifier {
  List<dynamic> dataList = [];

  Future<List> callApi() async {
    ApiHelper apiHelper = ApiHelper();
    var response = await apiHelper.RailwayApiCall();
    dataList = response;
    return dataList;
  }
}
