import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper1/modal/theme_model.dart';
import 'package:sky_scrapper1/provider/theme_provider.dart';
import 'package:sky_scrapper1/provider/weatherProvider.dart';
import 'package:sky_scrapper1/view/splash_screen.dart';
import 'package:sky_scrapper1/view/weather_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences Pref = await SharedPreferences.getInstance();

  bool isDark = Pref.getBool("isDark") ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ThemeProvider(themeModel: ThemeModel(isDark: isDark)),
        ),
      ],
      child: const MyApp(),
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
        "splash_screen": (context) => IntroScreen(),
        "/": (context) => WeatherScreen(),
      },
    );
  }
}
