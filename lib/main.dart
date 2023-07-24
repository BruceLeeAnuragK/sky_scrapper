import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/provider/weatherProvider.dart';
import 'package:sky_scrapper/view/splash_screen.dart';
import 'package:sky_scrapper/view/weather_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        )
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "splash_screen",
      routes: {
        "splash_screen": (context) => IntroScreen(),
        "/": (context) => WeatherScreen(),
      },
    );
  }
}
