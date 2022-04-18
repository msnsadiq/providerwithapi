import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/repository/Open%20Page/openpage.dart';

import '../../provider/provider.dart';
import '../../provider/tvshowtop_provider.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    // final tvtopprovider = Provider.of<TvTopProvider>(context, listen: false);
    // tvtopprovider.getTvTopItems(context);
    // final provider = Provider.of<ProviderItems>(context, listen: false);
    // provider.buildProviderTrending(context);
    waitingScreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final tvtopprovider = Provider.of<TvTopProvider>(context);
    // final provider = Provider.of<ProviderItems>(context);
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "TMDB",
          style: TextStyle(
              color: Colors.red,
              fontFamily: "splash",
              letterSpacing: 2,
              fontSize: 39),
        ),
      ),
    );
  }

  Future<void> waitingScreen() async {
    await Future.delayed(Duration(seconds: 4));
    await Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => OpenPage()));
  }
}
