import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/categorypage.dart';
import 'package:providersapi/homepage.dart';
import 'package:providersapi/provider/provider.dart';
import 'package:providersapi/provider/searchmovieprovider.dart';
import 'package:providersapi/repository/Open%20Page/openpage.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderItems>(create: (_) => ProviderItems()),
        ChangeNotifierProvider<SearchMovieProvider>(create: (_)=>SearchMovieProvider())
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
          primarySwatch: Colors.grey,
        ),
       // home: ScreenHome());
    //home: CategoryPage()
      home: OpenPage(),
    );
  }
}
//8417e5718758d632f59c399f948b60ea

