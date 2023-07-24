import 'dart:convert';

import 'package:http/http.dart' as http;

class APIhelper {
  APIhelper._();
  static final APIhelper apihelper = APIhelper._();
  String Api = "https://dummyjson.com/posts/15";
  String Api2 = "https://jsonplaceholder.typicode.com/posts";
  Future<List?> getWallpaperResponse({required String query}) async {
    String WallpaperApi =
        "https://pixabay.com/api/?key=37043026-230b0692a2c7c3b735944c114&q=$query";
    http.Response response = await http.get(Uri.parse(WallpaperApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List allData = data["hits"];
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
