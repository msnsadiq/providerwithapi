import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/provider/searchmovieprovider.dart';
import 'package:providersapi/secondpage.dart';
import 'package:providersapi/tvDetailsPage/tvDetailPage.dart';

class MovieSuggest extends StatefulWidget {
  const MovieSuggest({Key? key}) : super(key: key);

  @override
  State<MovieSuggest> createState() => _MovieSuggestState();
}

class _MovieSuggestState extends State<MovieSuggest> {
  final String imageurl = "https://image.tmdb.org/t/p/w500/";
  @override
  Widget build(BuildContext context) {
    final searchMovieProvider = Provider.of<SearchMovieProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 25),
                child: Container(
                  color: Colors.white,
                  child: TextField(
                    onChanged: (value) {
                      searchMovieProvider.searchMovieWork(context, value);
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        hintText: 'Which movie do you like?',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Recent",
                    style: TextStyle(color: Colors.white),
                  )),
              searchMovieProvider.loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                          ),
                          itemCount: searchMovieProvider
                              .searchMovieModel.results!.length,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TvDetailPage(
                                          id: searchMovieProvider.searchMovieModel
                                              .results![index].id
                                              .toString(),
                                        )));
                              },
                              // child:
                              child: Container(
                                color: Colors.red,
                                height: 150,
                                child: Row(
                                  children: [
                                    Card(

                                      child: Image.network(imageurl+ searchMovieProvider.searchMovieModel.results![index].posterPath.toString(),fit: BoxFit.fill,),
                                    )
                                  ],
                                ),
                              ),
                            );

                          }),

                    ),
            ],
          ),
        ),
      ),
    );
  }
}
