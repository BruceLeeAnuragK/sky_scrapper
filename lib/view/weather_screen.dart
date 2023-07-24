import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/helper/helper_provider.dart';
import 'package:sky_scrapper/provider/weatherProvider.dart';

import '../modal/weather_modal.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
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
        body: (provider.connectmodal.connectivityStatus !=
                "Waiting for the Network...")
            ? FutureBuilder(
                future: APIhelper.apihelper.getWeatherResponse(query: "surat"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<WeatherModel> posts =
                        snapshot.data as List<WeatherModel>;
                    switch (provider.connectmodal.connectivityStatus) {
                      case ConnectivityResult.mobile:
                        provider.connectmodal.connectivityStatus =
                            "Mobile network";
                        return Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                suffixIconColor: Colors.deepPurple,
                                suffixIcon: Icon(
                                  Icons.search,
                                  size: 30,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                      width: 10,
                                      color: Colors.deepPurple,
                                    )),
                              ),
                              onSubmitted: (val) {
                                print("SEARCH : $val");
                                provider.searchcity(val: val);
                              },
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 250,
                                  width: double.infinity,
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://cdn.dribbble.com/users/2277649/screenshots/8498294/weather_dribbble_size.gif.gif"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  itemCount: posts.length,
                                  itemBuilder: (context, index) => ListTile(
                                    title:
                                        Text("${posts[index].location.name}"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                        break;

                      case ConnectivityResult.wifi:
                        provider.connectmodal.connectivityStatus =
                            "Wifi network";
                        break;

                      case ConnectivityResult.none:
                        provider.connectmodal.connectivityStatus =
                            "Waiting for the Network...";
                        break;

                      default:
                        print("No Acccess");
                        break;
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(""),
                    );
                  } else {
                    return Center(
                      child: Text(""),
                    );
                  }
                },
              )
            : Column(),
      );
    });
  }
}
