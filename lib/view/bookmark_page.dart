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
    return Consumer<BookMarkProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "BookMark",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          leading: Container(),
        ),
        body: ListView.builder(
          itemCount: provider.bookmarkList.length,
          itemBuilder: (context, index) => ListTile(),
        ),
      );
    });
  }
}
