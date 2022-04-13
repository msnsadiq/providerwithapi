import 'package:flutter/material.dart';
import 'package:providersapi/provider/searchProvider.dart';
import 'package:providersapi/searchmovie%20details/screensearchmovie.dart';
import 'package:providersapi/searchmovie details/screensearchmovie.dart';
class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Icon CustomIcon = Icon(Icons.search);
 Widget CustomTitle = Text("TMDB");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
   appBar: AppBar(
     title: CustomTitle,
     actions: [
       IconButton(
           onPressed: () {
             setState(() {
               if (CustomIcon.icon == Icons.search) {
                 if (CustomIcon.icon == Icons.search) {
                   CustomIcon = Icon(Icons.cancel);
                   CustomTitle = ListTile(
                     leading: Icon(Icons.search),
                     title: TextField(
                       autofocus: true,

                       onSubmitted: (value){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SearchDisplay(moviename: value) ) );
                       },
                       decoration: const InputDecoration(
                           border: OutlineInputBorder(),
                           hintText: "Search..."),
                     ),
                   );
                 }
               } else {
                 CustomIcon = Icon(Icons.search);
                 CustomTitle = Text("location name");
               }
             });
           },
           icon: CustomIcon)
     ],

   ),

   /// optional searchbar
   // body: Column(children: [
   //   SizedBox(height: 40,),
   //   Card(
   //     margin: EdgeInsets.symmetric(horizontal: 35),
   //     child: ListTile(
   //       leading: IconButton(onPressed: (){
   //         showSearch(context: context,
   //
   //             delegate: CustomSearchDelegate());
   //
   //
   //
   //       }, icon: Icon(Icons.search)),
   //     ),
   //   )
   // ],),
     ///


    );
  }
}
//https://api.themoviedb.org/3/search/movie?api_key=55c72b3a0898da6b37311cf0603659e2&language=en-US&query=&page=1&include_adult=false