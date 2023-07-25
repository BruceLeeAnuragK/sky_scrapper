import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper1/helper/helper_provider.dart';
import 'package:sky_scrapper1/provider/weatherProvider.dart';

import '../modal/weather_modal.dart';

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
                future: APIhelper.apihelper.getWeatherResponse(query: "surat"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map posts = snapshot.data as Map;
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
                            Text(posts['name'])
                          ],
                        ),
                      ],
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
