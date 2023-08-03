import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper1/modal/bookmark_model.dart';
import 'package:sky_scrapper1/modal/theme_model.dart';
import 'package:sky_scrapper1/provider/bookmark_provider.dart';
import 'package:sky_scrapper1/provider/theme_provider.dart';
import 'package:sky_scrapper1/provider/weatherProvider.dart';
import 'package:sky_scrapper1/view/bookmark_page.dart';
import 'package:sky_scrapper1/view/splash_screen.dart';
import 'package:sky_scrapper1/view/weather_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences Pref = await SharedPreferences.getInstance();
  SharedPreferences Book = await SharedPreferences.getInstance();
  bool isDark = Pref.getBool("isDark") ?? false;
  List<String> isbookmark = Book.getStringList("BOOKMARK_KEY") ?? [];
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            themeModel: ThemeModel(isDark: isDark),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => BookMarkProvider(
            bookmark: BookmarkModel(weather: isbookmark),
          ),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode:
          (Provider.of<ThemeProvider>(context, listen: true).themeModel.isDark)
              ? ThemeMode.dark
              : ThemeMode.light,
      initialRoute: "splash_screen",
      routes: {
        "bookmark_page": (context) => BookMarkPage(),
        "splash_screen": (context) => IntroScreen(),
        "/": (context) => WeatherScreen(),
      },
    );
  }
}
