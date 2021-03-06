import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenTwo extends StatefulWidget {
  ScreenTwo({Key? key, required this.id}) : super(key: key);
  String id;
  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final String imageurl = "https://image.tmdb.org/t/p/w500/";
  bool isloading = false;
  bool tappp = false;
  changeBool() {
    tappp = true;
  }

  @override
  void initState() {
    final providerItem = Provider.of<ProviderItems>(context, listen: false);
    providerItem.builProviderMovieId(context, widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerItem = Provider.of<ProviderItems>(context);
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: providerItem.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            providerItem.movieIdModel.posterPath != null
                                ? "assets/errorpic/noterror.jpg"
                                : "assets/errorpic/error.jpg"),
                        fit: BoxFit.fill
                        //NetworkImage(imageurl + providerItem.movieIdModel.posterPath.toString()

                        ),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        providerItem.movieIdModel.title != null
                            ? SizedBox(
                                width: 350,
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(33, 19, 0, 0),
                                    child: Text(
                                      providerItem.movieIdModel.title
                                          .toString(),
                                      style: GoogleFonts.bevan(
                                          color: Colors.white, fontSize: 20),
                                    )),
                              )
                            : Text(
                                "Trending Movie",
                                style: GoogleFonts.bevan(
                                    color: Colors.white, fontSize: 20),
                              ),
                        providerItem.movieIdModel.runtime != null
                            ? SizedBox(
                                width: 350,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(33, 0, 0, 0),
                                  child: Text(
                                    "RunTime:  " +
                                        providerItem.movieIdModel.runtime
                                            .toString() +
                                        "m",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : Text("sorry, the page not found",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                        providerItem.movieIdModel.originalLanguage != null
                            ? SizedBox(
                                width: 350,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(33, 0, 0, 0),
                                  child: Container(
                                      child: Text(
                                    "language:  " +
                                        providerItem
                                            .movieIdModel.originalLanguage
                                            .toString(),
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              )
                            : Text("sorry, the page not found",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                        providerItem.movieIdModel.originalLanguage != null
                            ? SizedBox(
                                width: 350,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(33, 0, 0, 0),
                                  child: Container(
                                      child: Text(
                                    "Release Date:  " +
                                        providerItem.movieIdModel.releaseDate
                                            .toString(),
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              )
                            : Text("sorry, the page not found",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                        providerItem.movieIdModel.posterPath != null
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 38.0, left: 15, right: 15),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .40,
                                  width: double.infinity,
                                  child: Card(
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500" +
                                          providerItem.movieIdModel.posterPath
                                              .toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                        providerItem.movieIdModel.posterPath != null
                            ? Card(
                                elevation: 19,
                                color: Colors.blueGrey,
                                child: Text(
                                  providerItem.movieIdModel.title.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            : Text("sorry, the page not found",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                        providerItem.movieIdModel.overview != null
                            ? SizedBox(
                                width: 350,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(30, 10, 5, 0),
                                  child: Text(
                                      providerItem.movieIdModel.overview
                                          .toString(),
                                      style: TextStyle(color: Colors.white),
                                      maxLines: isloading ? null : 2,
                                      overflow: isloading
                                          ? TextOverflow.visible
                                          : TextOverflow.ellipsis),
                                ),
                              )
                            : Text("sorry, the page not found",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                        providerItem.movieIdModel.posterPath != null
                            ? TextButton(
                                onPressed: () {
                                  setState(() {
                                    isloading = !isloading;
                                  });
                                },
                                child:
                                    Text(isloading ? "show less" : "show more"))
                            : SizedBox(),
                        providerItem.movieIdModel.voteAverage != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: SizedBox(
                                    height: 30,
                                    width: 350,
                                    child: providerItem
                                                .movieIdModel.posterPath !=
                                            null
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 26.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  FontAwesomeIcons.imdb,
                                                  color: Colors.yellow,
                                                ),
                                                Text(
                                                  providerItem.movieIdModel
                                                          .voteAverage
                                                          .toString() +
                                                      "/10",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),

                                                // Icon(
                                                //   FontAwesomeIcons.star,
                                                //   color: Colors.blue,
                                                //   size: 18,
                                                // ),
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        //changeBool();
                                                        tappp = !tappp;
                                                      });
                                                    },
                                                    icon: tappp
                                                        ? Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                            size: 20,
                                                          )
                                                        : Icon(
                                                            FontAwesomeIcons
                                                                .star,
                                                            color: Colors.blue,
                                                            size: 18,
                                                          )),

                                                Text(
                                                  "Rate",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                      fontSize: 21),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox()),
                              )
                            : Center(
                                child: Text("sorry, the page not found",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                        providerItem.movieIdModel.posterPath != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 48.0),
                                child: SizedBox(
                                  height: 30,
                                  width: 250,
                                  child: Card(
                                    color: Colors.grey,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Text(
                                          "Add to Watchlist",
                                          style: GoogleFonts.rubikBeastly(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Text(""),
                        providerItem.movieIdModel.posterPath != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          await launch(
                                              "https://www.facebook.com");
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: () async {
                                          await launch(
                                              "https://www.instagram.com");
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.instagram,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: () async {
                                          await launch(
                                              'https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoiZW4ifQ%3D%3D%22%7D');
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: () async {
                                          await launch(
                                              'https://www.youtube.com/');
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.youtube,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
