import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper1/modal/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel;

  ThemeProvider({
    required this.themeModel,
  });

  changeTheme() async {
    themeModel.isDark = !themeModel.isDark;

    SharedPreferences Pref = await SharedPreferences.getInstance();

    await Pref.setBool("isDark", themeModel.isDark);

    notifyListeners();
  }
}
