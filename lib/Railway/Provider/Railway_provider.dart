import 'package:flutter/material.dart';

import '../../utils/Railway_Helper.dart';
import '../model/Railway_model.dart';

class HomeProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  HomeModal homeModal = HomeModal();
  TextEditingController trainc = TextEditingController();
  String train = "Rajdhani";

  Future<void> coronaApiGet() async {
    var response = await apiHelper.coronaApiCall(train);
    homeModal = response!;
    notifyListeners();
  }

  void search() {
    train = trainc.text;
    notifyListeners();
    }
}