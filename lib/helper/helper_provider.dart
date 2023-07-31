import 'dart:convert';

import 'package:http/http.dart' as http;

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

  Future<Map?> getCurrentWeatherResponse({required String query}) async {
    String currentWeatherApi =
        "http://api.weatherapi.com/v1/forecast.json?key= c6f63f932d1e4e3b8c334544232407&q=$query&days=1&aqi=no&alerts=no";
    http.Response response = await http.get(Uri.parse(currentWeatherApi));

    if (response.statusCode == 200) {
      var data1 = jsonDecode(response.body);
      Map allData = data1["current"];
      print("###########################");
      print(allData);
      print(allData.runtimeType);
      print("###########################");
      return allData;
    }
  }

  Future<Map?> getForecasteWeatherResponse({required String query}) async {
    String forecasteWeatherApi =
        "http://api.weatherapi.com/v1/forecast.json?key=c6f63f932d1e4e3b8c334544232407&q=$query&days=1&aqi=no&alerts=no";
    http.Response response = await http.get(Uri.parse(forecasteWeatherApi));

    if (response.statusCode == 200) {
      var data2 = jsonDecode(response.body);
      Map allData = data2["forecast"];
      print("###########################");
      print(allData);
      print(allData.runtimeType);
      print("###########################");
      return allData;
    }
  }
}
