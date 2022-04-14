// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:providersapi/provider/searchProvider.dart';
// import 'package:providersapi/provider/searchmovieprovider.dart';
//
// class CategoryPage extends StatefulWidget {
//   CategoryPage({Key? key,required this.moviename}) : super(key: key);
//   String moviename;
//   @override
//   State<CategoryPage> createState() => _CategoryPageState();
// }
//
// class _CategoryPageState extends State<CategoryPage> {
//
//   @override
//   void initState() {
//     final searchMovieProvider = Provider.of<SearchMovieProvider>(context,listen: false);
//     searchMovieProvider.searchMovieWork(context, widget.moviename);
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final searchMovieProvider = Provider.of<SearchMovieProvider>(context,listen: false);
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: searchMovieProvider.loading ? Center(child: CircularProgressIndicator(),):
//
//       ListView.builder(
//           itemCount: searchMovieProvider.searchMovieModel.results!.length,
//           itemBuilder: (ctx,index){
//         return  Container(
//
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: NetworkImage(searchMovieProvider.searchMovieModel.results![index].posterPath.toString()))
//           ),
//         );
//       })
//
//
//
//
//
//
//     );
//   }
// }
//https://api.themoviedb.org/3/search/movie?api_key=55c72b3a0898da6b37311cf0603659e2&language=en-US&query=&page=1&include_adult=false

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/searchmovieprovider.dart';

class SearchDisplay extends StatefulWidget {
   SearchDisplay({Key? key,required this.moviename}) : super(key: key);
  String moviename;
  @override
  State<SearchDisplay> createState() => _SearchDisplayState();
}

class _SearchDisplayState extends State<SearchDisplay> {
  final String imageurl = "https://image.tmdb.org/t/p/w500/";
  @override
  void initState() {
    final searchMovieProvider = Provider.of<SearchMovieProvider>(context,listen: false);
    searchMovieProvider.searchMovieWork(context, widget.moviename);
    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    final searchMovieProvider = Provider.of<SearchMovieProvider>(context);
    return Scaffold(
        backgroundColor: Colors.grey,
        body: searchMovieProvider.loading ? Center(child: CircularProgressIndicator(),):

        ListView.builder(
            itemCount: searchMovieProvider.searchMovieModel.results!.length,
            itemBuilder: (ctx,index){
              return  SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [

                    searchMovieProvider.searchMovieModel.results![index].posterPath != null ?     Container(

                     height: MediaQuery.of(context).size.height,

                      width: MediaQuery.of(context).size.width,
                      child:  Image.network( imageurl+searchMovieProvider.searchMovieModel.results![index].posterPath.toString()),
                    ):Icon(Icons.refresh,size: 55,),

                  ],
                ),
              );
            })

    );
  }
}
