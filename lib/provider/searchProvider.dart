import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/provider/provider.dart';
import 'package:providersapi/repository/api/MovieIdModel.dart';
import 'package:providersapi/repository/api/TrendingModel.dart';
import 'package:providersapi/repository/api/apiitem.dart';

class CustomSearchDelegate extends SearchDelegate{
 //late String id;
  AllApi allApi = AllApi();
  TrendingModel trendingModel = TrendingModel();
  MovieIdModel movieIdModel = MovieIdModel();
  ProviderItems providerItems = ProviderItems();
  List<String>searchTerms = [
    "spiderman",
    "batman",
    "ironman",
    "superman",
    "antman",
    "avengers"

  ];
  @override
  List<Widget>? buildActions(BuildContext context, ) {
    // TODO: implement buildActions
    //throw UnimplementedError();
    return [
    IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back_ios))

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
   // throw UnimplementedError();
    return IconButton(onPressed: (){
      query = "";
    }, icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
   // throw UnimplementedError();
    List<String>matchQuery = [];
    for(var movies in searchTerms){
      if(movies.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(movies);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (ctx,index){
          var allItems = matchQuery[index];
          return ListTile(
            title: Text(allItems),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //throw UnimplementedError();
    List<String>matchQuery = [];
    for(var movies in searchTerms){
      if(movies.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(movies);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (ctx,index){
          var allItems = matchQuery[index];
          return ListTile(
            title: Text(allItems),
          );
        });
  }

// btn(BuildContext context, String id)async{
//     final provideritem = Provider.of<ProviderItems>(context);
//     providerItems.builProviderMovieId(context, id);
//    await providerItems.movieIdModel.id.toString();
// }
}