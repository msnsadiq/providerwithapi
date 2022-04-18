import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:providersapi/categorypage.dart';
import 'package:providersapi/homepage.dart';
import 'package:providersapi/repository/mixedhome.dart';
import 'package:providersapi/repository/tvshowpage.dart';

class OpenPage extends StatefulWidget {
  OpenPage({Key? key}) : super(key: key);

  @override
  State<OpenPage> createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  int indexvalue = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await exitBtn(context);
      },
      child: Scaffold(
       extendBodyBehindAppBar: false,
        backgroundColor: Colors.yellow,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: indexvalue,

            unselectedItemColor: Colors.grey[600],
            selectedItemColor: Colors.white,
            unselectedLabelStyle: TextStyle(color: Colors.black),
            onTap: (value) {
              setState(() {
                indexvalue = value;
                pageController.animateToPage(value,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear);
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.movie), label: "Movies"),
              BottomNavigationBarItem(icon: Icon(Icons.tv), label: "TV shows")
            ]),
        body: PageView(
          controller: pageController,
          onPageChanged: (pageValue) {
            setState(() {
              indexvalue = pageValue;
            });
          },
          children: [
            MixedOpenPage(),
            ScreenHome(),
            TvShow(),
          ],
        ),
      ),
    );
  }

  exitBtn(BuildContext context) async {
    return showDialog(
        // barrierColor: Colors.black,
        context: context,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              "are you sure you want to exit",
              style: GoogleFonts.aladin(
                color: Colors.white,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      color: Colors.grey,
                      child: TextButton(
                        onPressed: () {
                          if (Platform.isAndroid) {
                            SystemNavigator.pop();
                          }
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.grey,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "NO",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
// pageController.animateToPage(valuee, duration: Duration(milliseconds: 500), curve: Curves.linear);