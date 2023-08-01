import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper1/modal/bookmark_model.dart';

class BookMarkProvider extends ChangeNotifier {
  BookmarkModel bookmark;

  BookMarkProvider({required this.bookmark});
  List bookMarkList = [
    bookmark.city,
    bookmark.state,
    bookmark.country,
    bookmark.date,
    bookmark.temp,
  ];
  addToBookMark() async {
    SharedPreferences Book = await SharedPreferences.getInstance();

    await Book.setStringList(
      "bookmark",
      [
        bookmark.city,
        bookmark.state,
        bookmark.country,
        bookmark.date,
        bookmark.temp,
      ],
    );

    notifyListeners();
  }

  List bookmarkList = [];
}
