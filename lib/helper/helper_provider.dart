import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper1/modal/weather_modal.dart';

class APIhelper {
  APIhelper._();
  static final APIhelper apihelper = APIhelper._();

  Future<Map?> getWeatherResponse({required String query}) async {
    String WeatherApi =
        "http://api.weatherapi.com/v1/forecast.json?key= c6f63f932d1e4e3b8c334544232407&q=$query&days=1&aqi=no&alerts=no";
    http.Response response = await http.get(Uri.parse(WeatherApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Map allData = data["location"];
      print("###########################");
      print(allData.runtimeType);
      print(allData.runtimeType);
      print("###########################");
      return allData;
    }
  }
}
