import 'package:flutter/material.dart';

import '../../utils/Railway_Helper.dart';
import '../model/Railway_model.dart';

class RailwayProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  RailwayModal RModal = RailwayModal();
  TextEditingController trainc = TextEditingController();
  String train = "Rajdhani";

  Future<void> Railway() async {
    var response = await apiHelper.RailwayApiCall(train);
    RModal = response!;
    notifyListeners();
  }

  void search() {
    train = trainc.text;
    notifyListeners();
    }
}