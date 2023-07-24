import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper/modal/weather_modal.dart';

class APIhelper {
  APIhelper._();
  static final APIhelper apihelper = APIhelper._();

  Future<WeatherModel?> getWeatherResponse({required String query}) async {
    String WeatherApi =
        "http://api.weatherapi.com/v1/forecast.json?key= c6f63f932d1e4e3b8c334544232407&q=$query&days=1&aqi=no&alerts=no";
    http.Response response = await http.get(Uri.parse(WeatherApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<WeatherModel> allData = data["location"];
      return allData;
    }
  }

  Future<List?> getAnimalWallpaperResponse() async {
    String WallAnimalpaperApi =
        "https://pixabay.com/api/?key=37043026-230b0692a2c7c3b735944c114&q=animal";
    http.Response response = await http.get(Uri.parse(WallAnimalpaperApi));

    if (response.statusCode == 200) {
      var Animaldata = jsonDecode(response.body);
      List allanimalData = Animaldata["hits"];
      return allanimalData;
    }
  }

  Future<List?> getCarWallpaperResponse() async {
    String WallCarpaperApi =
        "https://pixabay.com/api/?key=37043026-230b0692a2c7c3b735944c114&q=car";
    http.Response response = await http.get(Uri.parse(WallCarpaperApi));

    if (response.statusCode == 200) {
      var Cardata = jsonDecode(response.body);
      List allCarData = Cardata["hits"];
      return allCarData;
    }
  }

  Future<List?> getFlowerWallpaperResponse() async {
    String WallFlowerpaperApi =
        "https://pixabay.com/api/?key=37043026-230b0692a2c7c3b735944c114&q=flower";
    http.Response response = await http.get(Uri.parse(WallFlowerpaperApi));

    if (response.statusCode == 200) {
      var Flowerdata = jsonDecode(response.body);
      List allFlowerData = Flowerdata["hits"];
      return allFlowerData;
    }
  }

  Future<List?> getHouseWallpaperResponse() async {
    String WallHousepaperApi =
        "https://pixabay.com/api/?key=37043026-230b0692a2c7c3b735944c114&q=house";
    http.Response response = await http.get(Uri.parse(WallHousepaperApi));

    if (response.statusCode == 200) {
      var Housedata = jsonDecode(response.body);
      List allHouseData = Housedata["hits"];
      return allHouseData;
    }
  }
}
