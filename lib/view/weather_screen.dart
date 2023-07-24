import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: connectivity.onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ConnectivityResult res = snapshot.data!;

            switch (res) {
              case ConnectivityResult.mobile:
                return Center(
                  child: Text("Mobile  Network"),
                );

              case ConnectivityResult.wifi:
                return Center(
                  child: Text("Wifi  Network"),
                );

              case ConnectivityResult.none:
                return Center(
                  child: Text("No Network"),
                );

              default:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
