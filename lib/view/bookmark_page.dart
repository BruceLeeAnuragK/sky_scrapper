import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper1/provider/bookmark_provider.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BookMark",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blueAccent.shade100,
        centerTitle: true,
        leading: Container(),
      ),
      body: Consumer<BookMarkProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.bookmark.weather.length,
            itemBuilder: (context, index) => Card(
              color: Colors.blue.shade100,
              child: ListTile(
                title: Text("${provider.bookmark.weather[index]}"),
                subtitle: Text("${provider.bookmark.weather[index]}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
