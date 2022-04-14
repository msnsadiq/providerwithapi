import 'package:flutter/material.dart';
import 'package:providersapi/provider/searchProvider.dart';

class MixedOpenPage extends StatefulWidget {
  const MixedOpenPage({Key? key}) : super(key: key);

  @override
  State<MixedOpenPage> createState() => _MixedOpenPageState();
}

class _MixedOpenPageState extends State<MixedOpenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TMDB",
          style: TextStyle(
            color: Colors.red,
            fontFamily: "title",
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
