import 'package:flutter/material.dart';

class MixedOpenPage extends StatefulWidget {
  const MixedOpenPage({Key? key}) : super(key: key);

  @override
  State<MixedOpenPage> createState() => _MixedOpenPageState();
}

class _MixedOpenPageState extends State<MixedOpenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
