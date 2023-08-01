import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper1/helper/helper_provider.dart';
import 'package:sky_scrapper1/provider/weatherProvider.dart';

import '../provider/theme_provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

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
    return Consumer<WeatherProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          leading: const Column(),
          backgroundColor: Colors.blueAccent.shade100,
          title: const Text(
            "Weather App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("bookmark_page ");
              },
              icon: Icon(
                Icons.star_border_sharp,
                color: Provider.of<ThemeProvider>(context, listen: true)
                        .themeModel
                        .isDark
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            IconButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeTheme();
                },
                icon: Provider.of<ThemeProvider>(context, listen: true)
                        .themeModel
                        .isDark
                    ? Icon(
                        Icons.nightlight,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.sunny,
                        color: Colors.white,
                      )),
          ],
          centerTitle: true,
        ),
        body: (provider.connectmodal.connectivityStatus == "Waiting")
            ? const Column()
            : FutureBuilder(
                future: APIhelper.apihelper
                    .getWeatherResponse(query: "${provider.data}"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map posts = provider.data;
                    Map currentposts = provider.currentdata;
                    List forecasteposts = provider.forecastedata;
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
                                          suffixIconColor:
                                              Provider.of<ThemeProvider>(
                                                          context,
                                                          listen: true)
                                                      .themeModel
                                                      .isDark
                                                  ? Colors.black
                                                  : Colors.white,
                                          suffixIcon: const Icon(
                                            Icons.search,
                                            size: 30,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: const BorderSide(
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
                                          height: 280,
                                          width: 300,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    ("${posts["name"]}"),
                                                    style: TextStyle(
                                                      color:
                                                          Provider.of<ThemeProvider>(
                                                                      context,
                                                                      listen:
                                                                          true)
                                                                  .themeModel
                                                                  .isDark
                                                              ? Colors.black
                                                              : Colors.white,
                                                      fontSize: 30,
                                                    ),
                                                  ),
                                                  Image.network(
                                                      height: 100,
                                                      width: 100,
                                                      fit: BoxFit.fill,
                                                      "http:${currentposts["condition"]["icon"]}"),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    ("${posts["region"]},\n${posts["country"]}"),
                                                    style: TextStyle(
                                                      color:
                                                          Provider.of<ThemeProvider>(
                                                                      context,
                                                                      listen:
                                                                          true)
                                                                  .themeModel
                                                                  .isDark
                                                              ? Colors.black
                                                              : Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    ("                           "),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "${currentposts["temp_c"]}°C",
                                                      style: TextStyle(
                                                        color: Provider.of<
                                                                        ThemeProvider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .themeModel
                                                                .isDark
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "${forecasteposts[0]["date"]}",
                                                      style: TextStyle(
                                                        color: Provider.of<
                                                                        ThemeProvider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .themeModel
                                                                .isDark
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.star_border_sharp,
                                                      color:
                                                          Provider.of<ThemeProvider>(
                                                                      context,
                                                                      listen:
                                                                          true)
                                                                  .themeModel
                                                                  .isDark
                                                              ? Colors.black
                                                              : Colors.white,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: const LinearGradient(
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
                                    Text(""),
                                    ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 15,
                                          sigmaY: 15,
                                        ),
                                        child: Container(
                                          height: 400,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white60,
                                                Colors.white10,
                                              ],
                                            ),
                                          ),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: List.generate(
                                                provider
                                                    .forecastedata[0]['hour']
                                                    .length,
                                                (index) => Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "Time",
                                                          style: TextStyle(
                                                            color: Provider.of<
                                                                            ThemeProvider>(
                                                                        context,
                                                                        listen:
                                                                            true)
                                                                    .themeModel
                                                                    .isDark
                                                                ? Colors.black
                                                                : Colors.white,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${provider.forecastedata[0]['hour'][index]['time']}"
                                                              .substring(
                                                                  "${provider.forecastedata[0]['hour'][index]['time']}"
                                                                      .indexOf(
                                                                          ' '),
                                                                  16),
                                                          style: TextStyle(
                                                            color: Provider.of<
                                                                            ThemeProvider>(
                                                                        context,
                                                                        listen:
                                                                            true)
                                                                    .themeModel
                                                                    .isDark
                                                                ? Colors.black
                                                                : Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Image.network(
                                                      "http:${provider.forecastedata[0]['hour'][index]['condition']['icon']}",
                                                    ),
                                                    Text(
                                                      "${provider.forecastedata[0]['hour'][index]['temp_c']}°C",
                                                      style: TextStyle(
                                                        color: Provider.of<
                                                                        ThemeProvider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .themeModel
                                                                .isDark
                                                            ? Colors.black
                                                            : Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Divider(),
                                                    Image.network(
                                                        "https://cdn-icons-png.flaticon.com/128/9231/9231936.png",
                                                        height: 35),
                                                    Text(
                                                      "${provider.forecastedata[0]['hour'][index]['wind_kph']} km",
                                                      style: TextStyle(
                                                        color: Provider.of<
                                                                        ThemeProvider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .themeModel
                                                                .isDark
                                                            ? Colors.black
                                                            : Colors.white,
                                                      ),
                                                    ),
                                                    Divider(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "Humidity",
                                                            style: TextStyle(
                                                              color: Provider.of<
                                                                              ThemeProvider>(
                                                                          context,
                                                                          listen:
                                                                              true)
                                                                      .themeModel
                                                                      .isDark
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                          ),
                                                          Image.network(
                                                              "https://cdn-icons-png.flaticon.com/128/1628/1628763.png",
                                                              height: 35),
                                                          Text(
                                                            "${provider.forecastedata[0]['hour'][index]['humidity']}%",
                                                            style: TextStyle(
                                                              color: Provider.of<
                                                                              ThemeProvider>(
                                                                          context,
                                                                          listen:
                                                                              true)
                                                                      .themeModel
                                                                      .isDark
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                    return const Center(
                      child: Text(""),
                    );
                  }
                },
              ),
      );
    });
  }
}
