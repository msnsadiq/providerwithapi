//https://api.themoviedb.org/3/search/movie?api_key=55c72b3a0898da6b37311cf0603659e2&language=en-US&query=&page=1&include_adult=false

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/secondpage.dart';

import '../provider/searchmovieprovider.dart';

class SearchDisplay extends StatefulWidget {
  SearchDisplay({Key? key, required this.moviename}) : super(key: key);
  String moviename;
  @override
  State<SearchDisplay> createState() => _SearchDisplayState();
}

class _SearchDisplayState extends State<SearchDisplay> {
  final String imageurl = "https://image.tmdb.org/t/p/w500/";
  @override
  void initState() {
    final searchMovieProvider =
        Provider.of<SearchMovieProvider>(context, listen: false);
    searchMovieProvider.searchMovieWork(context, widget.moviename);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchMovieProvider = Provider.of<SearchMovieProvider>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leadingWidth: 4,
            title: Text("Top Results",
                style: GoogleFonts.arbutusSlab(color: Colors.redAccent)),
            backgroundColor: Colors.black,
          ),
          body: searchMovieProvider.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                      top: 3.0, bottom: 8, left: 8, right: 8),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemCount:
                          searchMovieProvider.searchMovieModel.results!.length,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => ScreenTwo(
                                    id: searchMovieProvider
                                        .searchMovieModel.results![index].id
                                        .toString())));
                          },
                          child: searchMovieProvider.searchMovieModel
                                      .results![index].posterPath !=
                                  null
                              ? Card(
                                  elevation: 20,
                                  shadowColor: Colors.red,
                                  child: Image.network(
                                    imageurl +
                                        searchMovieProvider.searchMovieModel
                                            .results![index].posterPath
                                            .toString(),
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : SizedBox(),
                        );
                      }),
                )),
    );
  }
}
