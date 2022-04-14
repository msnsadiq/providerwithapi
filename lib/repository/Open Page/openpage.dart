import 'package:flutter/material.dart';
import 'package:providersapi/categorypage.dart';
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
    return Scaffold(
      backgroundColor: Colors.yellow,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
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
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
              BottomNavigationBarItem(icon: Icon(Icons.tv), label: "TV shows")
            ]),
      ),
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
    );
  }
}
// pageController.animateToPage(valuee, duration: Duration(milliseconds: 500), curve: Curves.linear);