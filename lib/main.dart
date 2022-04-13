import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/homepage.dart';
import 'package:providersapi/provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderItems>(create: (_) => ProviderItems())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'providersapi',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ScreenHome());
  }
}
//8417e5718758d632f59c399f948b60ea

