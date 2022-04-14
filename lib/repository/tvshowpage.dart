import 'package:flutter/material.dart';

class TvShow extends StatefulWidget {
  const TvShow({Key? key}) : super(key: key);

  @override
  State<TvShow> createState() => _TvShowState();
}

class _TvShowState extends State<TvShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
    );
  }
}
