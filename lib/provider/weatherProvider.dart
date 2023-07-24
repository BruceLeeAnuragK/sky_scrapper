import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:sky_scrapper/helper/helper_provider.dart';

class WeatherProvider extends ChangeNotifier {
  List data = [];
  WeatherProvider() {
    searchcity();
  }
  searchcity({String val = "surat"}) async {
    data = await APIhelper.apihelper.getWeatherResponse(query: val) ?? [];
    notifyListeners();
    return 0;
  }
}
