import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper1/helper/helper_provider.dart';
import 'package:sky_scrapper1/provider/weatherProvider.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<WeatherProvider>(context, listen: false).check();
  }

  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();

    return Consumer<WeatherProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent.shade100,
          title: Text(
            "Weather App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: (provider.connectmodal.connectivityStatus == "Waiting")
            ? Column()
            : FutureBuilder(
                future: APIhelper.apihelper
                    .getWeatherResponse(query: "${provider.data}"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map posts = provider.data as Map;
                    Map currentposts = provider.currentdata as Map;
                    Map forecasteposts = provider.forecastedata as Map;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            child: Stack(
                              children: [
                                Container(
                                  height: 900,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.blueAccent.shade100,
                                        Colors.blueAccent.shade700,
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          suffixIconColor: Colors.white,
                                          suffixIcon: Icon(
                                            Icons.search,
                                            size: 30,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide(
                                              width: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        onSubmitted: (val) {
                                          print("SEARCH : $val");
                                          provider.searchcity(val: val);
                                        },
                                      ),
                                    ),
                                    ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 15,
                                          sigmaY: 15,
                                        ),
                                        child: Container(
                                          height: 200,
                                          width: 300,
                                          child: Column(
                                            children: [
                                              Text(("${posts["name"]}")),
                                              Text(
                                                  "${currentposts["condition"]["icon"]}"),
                                              Text(
                                                  "${forecasteposts["forecastday"][0]["hour"][0]["condition"]["text"]}"),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white60,
                                                Colors.white10,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 15,
                                          sigmaY: 15,
                                        ),
                                        child: Container(
                                          height: 200,
                                          width: 300,
                                          child: Column(
                                            children: [],
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white60,
                                                Colors.white10,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Center(
                      child: Text(""),
                    );
                  }
                },
              ),
      );
    });
  }
}
