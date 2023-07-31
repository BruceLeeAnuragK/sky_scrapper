import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import '../helper/helper_provider.dart';
import '../modal/connectivity_modal.dart';

class WeatherProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();
  Connect connectmodal = Connect(
    connectivityStatus: "Waiting",
  );
  void check() async {
    connectmodal.connectivitystream =
        await connectivity.onConnectivityChanged.listen(
      (ConnectivityResult connectivityresult) {
        switch (connectivityresult) {
          case ConnectivityResult.mobile:
            connectmodal.connectivityStatus = "Mobile";
            notifyListeners();
            break;

          case ConnectivityResult.wifi:
            connectmodal.connectivityStatus = "Wifi";
            print("On WiFi");
            notifyListeners();
            break;

          case ConnectivityResult.none:
            connectmodal.connectivityStatus = "Waiting";
            notifyListeners();
            break;

          default:
            connectmodal.connectivityStatus = "Waiting";
            notifyListeners();
            break;
        }
      },
    );
  }

  /////
  Map data = {};
  Map currentdata = {};
  late List forecastedata = [];

  WeatherProvider() {
    searchcity();
    currentData();
  }
  searchcity({String val = "surat"}) async {
    data = await APIhelper.apihelper.getWeatherResponse(query: val) ?? {};

    forecastedata =
        await APIhelper.apihelper.getForecasteWeatherResponse(query: val) ?? [];

    notifyListeners();
    return 0;
  }

  currentData({String val = "surat"}) async {
    currentdata =
        await APIhelper.apihelper.getCurrentWeatherResponse(query: val) ?? {};
  }
}
