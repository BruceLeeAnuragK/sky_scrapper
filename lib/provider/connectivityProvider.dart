import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_scrapper/modal/connectivity_modal.dart';

class ConnectivityProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();
  Connect connectmodal = Connect(
    connectivityStatus: "Waiting...",
  );
  void check() {
    connectmodal.connectivitystream = connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityresult) {
      switch (connectivityresult) {
        case ConnectivityResult.mobile:
          connectmodal.connectivityStatus = "Mobile";
          break;

        case ConnectivityResult.wifi:
          connectmodal.connectivityStatus = "wifi";
          break;

        case ConnectivityResult.none:
          connectmodal.connectivityStatus = "No Connected";
          break;

        default:
          print("No Acccess");
          break;
      }
    });
  }
}
