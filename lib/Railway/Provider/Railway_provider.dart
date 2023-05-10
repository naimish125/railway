import 'package:flutter/cupertino.dart';
import '../../utils/Railway_Helper.dart';

class RailwayProvider extends ChangeNotifier {
  Future<List> getRailway() async {
    ApiHelper apiHelper = ApiHelper();

    List l1 = await apiHelper.RAilwayApicall();
    return l1;
  }
}