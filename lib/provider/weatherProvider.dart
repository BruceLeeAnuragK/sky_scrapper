import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import '../helper/helper_provider.dart';
import '../modal/connectivity_modal.dart';

class WeatherProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();
  Connect connectmodal = Connect(
    connectivityStatus: "Waiting for the Network...",
  );
  void check() {
    connectmodal.connectivitystream = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult connectivityresult) {
        switch (connectivityresult) {
          case ConnectivityResult.mobile:
            connectmodal.connectivityStatus = "Mobile network";
            break;

          case ConnectivityResult.wifi:
            connectmodal.connectivityStatus = "Wifi network";
            break;

          case ConnectivityResult.none:
            connectmodal.connectivityStatus = "Waiting for the Network...";
            break;

          default:
            print("No Acccess");
            break;
        }
      },
    );
  }

  /////
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
