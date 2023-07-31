import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/bookmark_model.dart';

class BookMarkProvider extends ChangeNotifier {
  Bookmark bookmark;

  BookMarkProvider({required this.bookmark});
  addToBookMark() async {
    bookmark.city;
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
}
