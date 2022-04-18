
import 'package:flutter/material.dart';
import 'package:providersapi/searchmovie%20details/screensearchmovie.dart';

class DataSearch extends SearchDelegate{
 // final String activeTab;
  //DataSearch({required this.activeTab});
  List<String>searchTerms = [
    "spiderman",
    "batman",
    "ironman",
    "superman",
    "antman",
    "avengers"

  ];


  @override
  List<Widget> buildActions(BuildContext context){
    return [

      IconButton(
        icon: Icon(Icons.search,color: Colors.red,size: 45,),
        onPressed: (){
          //query=activeTab;
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SearchDisplay(moviename: query)));
        },
      ),
      SizedBox(width: 10,)

    ];
  }

  @override
  Widget buildLeading(BuildContext context) => IconButton(
    icon: Icon(Icons.close),
    onPressed: () => close(context, null),
  );

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Center(child: Text(query,style: TextStyle(color: Colors.white),))),);



  }

  /// worked on keyboard search . but not work back button when enter the movie page
  // @override
  //  buildResults(BuildContext context)async {
  //   return
  //
  //     await Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SearchDisplay(moviename: query)));
  //
  // }
  /// end

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String>matchQuery = [];
    for(var movies in searchTerms){
      if(movies.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(movies);
      }
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (ctx,index){
            var allItems = matchQuery[index];
            return GestureDetector(
              onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SearchDisplay(moviename: allItems)));
              },
              child: ListTile(

                title: Text(allItems,style: TextStyle(color: Colors.white),),
              ),
            );
          }),
    );
  }
  }
