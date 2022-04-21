import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

//import 'package:providersapi/categorypage.dart';
import 'package:providersapi/homepage.dart';
import 'package:providersapi/provider/provider.dart';
import 'package:providersapi/provider/searchmovieprovider.dart';
import 'package:providersapi/provider/tvdetails_provider.dart';
import 'package:providersapi/provider/tvshowtop_provider.dart';
import 'package:providersapi/repository/Open%20Page/openpage.dart';
import 'package:providersapi/repository/Open%20Page/splashscreen.dart';
import 'package:providersapi/repository/api/apiitem.dart';
//import 'package:providersapi/repository/trending_movie_bloc.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderItems>(create: (_) => ProviderItems()),
        ChangeNotifierProvider<SearchMovieProvider>(
            create: (_) => SearchMovieProvider()),
        ChangeNotifierProvider<TvTopProvider>(create: (_) => TvTopProvider()),
        ChangeNotifierProvider<TvDetailsProvider>(
            create: (_) => TvDetailsProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
 MyApp({Key? key}) : super(key: key);
AllApi allApi = AllApi();
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
        //home: OpenPage(),
        home: ScreenSplash(),
      );

  }
}
//8417e5718758d632f59c399f948b60ea

