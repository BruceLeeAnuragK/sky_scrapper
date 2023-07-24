import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.of(context).pushNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.dribbble.com/users/2277649/screenshots/8498294/weather_dribbble_size.gif.gif"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              "Weather App",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue.shade100,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.book, size: 300, color: Colors.blue.shade100),
            CircularProgressIndicator(
              color: Colors.blue.shade100,
            ),
          ],
        ),
      ),
    );
  }
}
