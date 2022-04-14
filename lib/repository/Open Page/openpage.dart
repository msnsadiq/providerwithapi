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
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: indexvalue,
          unselectedItemColor: Colors.pink,
          selectedItemColor: Colors.blue,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          onTap: (value){

            setState(() {
              indexvalue = value;
              pageController.animateToPage(value, duration: Duration(milliseconds: 500), curve: Curves.linear);
            });
          },

          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.movie),label: "Movies"),
        BottomNavigationBarItem(icon: Icon(Icons.tv),label: "TV shows")
      ]),
      body: PageView(
        controller: pageController,
        onPageChanged: (pageValue){
          setState(() {
            indexvalue = pageValue;
          });
        },
        children: [
          MixedOpenPage(),
          CategoryPage(),
          ScreenHome(),
          TvShow(),

        ],
      ),
    );
  }
}
// pageController.animateToPage(valuee, duration: Duration(milliseconds: 500), curve: Curves.linear);