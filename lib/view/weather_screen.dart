import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/provider/weatherProvider.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();

    return Consumer<WeatherProvider>(
      builder: (context,provider, child) {
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
          body: FutureBuilder(
            future: ,
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
    );
  }
}
