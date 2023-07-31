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
      print(allData.toString());
      print(allData.runtimeType);
      print("###########################");
      return allData;
    }
  }

  Future getForecasteWeatherResponse({required String query}) async {
    String forecasteWeatherApi =
        "http://api.weatherapi.com/v1/forecast.json?key=c6f63f932d1e4e3b8c334544232407&q=$query&days=1&aqi=no&alerts=no";
    http.Response response = await http.get(Uri.parse(forecasteWeatherApi));

    if (response.statusCode == 200) {
      var data2 = jsonDecode(response.body);
      List allData = data2["forecast"]['forecastday'];
      print("###########################");
      print(allData);
      print(allData.runtimeType);
      print("###########################");
      return allData;
    }
  }

  Future alldayWeather({required String Location}) async {
    String weatherapi =
        "http://api.weatherapi.com/v1/history.json?key=857e6eab0b414c1084b65918232307&q=$Location&dt=${DateTime.now().toString()}";

    http.Response response = await http.get(Uri.parse(weatherapi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List allData = await data['forecast']['forecastday'];
      return allData;
    }
  }

  nextdayWeather({required String Location}) async {
    String weatherapi =
        "http://api.weatherapi.com/v1/forecast.json?key=857e6eab0b414c1084b65918232307&q=$Location&days=7&aqi=no&alerts=no";
    http.Response response = await http.get(Uri.parse(weatherapi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var weatherofnextday = await data['forecast']['forecastday'];
      return weatherofnextday;
    }
  }
}
