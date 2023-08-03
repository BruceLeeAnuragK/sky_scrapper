import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper1/modal/bookmark_model.dart';

class BookMarkProvider extends ChangeNotifier {
  BookmarkModel bookmark;

  BookMarkProvider({required this.bookmark});

  addToBookMark({
    required String city,
  }) async {
    bookmark.weather.add(city);

    SharedPreferences Book = await SharedPreferences.getInstance();
    await Book.setStringList("BOOKMARK_KEY", bookmark.weather);
    notifyListeners();
  }

  List bookmarkList = [];
}
