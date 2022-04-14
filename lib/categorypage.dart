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
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
   // appBar: AppBar(
   //   backgroundColor: Colors.blue,
   //
   //   title: CustomTitle,
   //   actions: [
   //     IconButton(
   //         onPressed: () {
   //           setState(() {
   //             if (CustomIcon.icon == Icons.search) {
   //               if (CustomIcon.icon == Icons.search) {
   //                 CustomIcon = Icon(Icons.cancel);
   //                 CustomTitle = ListTile(
   //                   leading: Icon(Icons.search),
   //                   title: TextField(
   //                     autofocus: true,
   //
   //                     onSubmitted: (value){
   //                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SearchDisplay(moviename: value) ) );
   //                     },
   //                     decoration: const InputDecoration(
   //
   //                         border: OutlineInputBorder(),
   //                         hintText: "Search..."),
   //                   ),
   //                 );
   //               }
   //             } else {
   //               CustomIcon = Icon(Icons.search);
   //               CustomTitle = Text("TMDB");
   //             }
   //           });
   //         },
   //         icon: CustomIcon)
   //   ],
   //
   // ),

   /// optional searchbar
   body:SingleChildScrollView(
     scrollDirection: Axis.vertical,
     child:  Column(children: [
      Container(
        height: MediaQuery.of(context).size.height/2,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1554050857-c84a8abdb5e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmxhY2t8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),fit: BoxFit.cover)
        ),
      ),
       Card(
         color: Colors.black,
         child: ListTile(
           leading: IconButton(onPressed: (){
             showSearch(context: context, delegate: DataSearch());
           }, icon: Icon(Icons.search,color: Colors.red,size: 40,),
           ),
           title: Text("Search",style: TextStyle(color: Colors.white),),
           subtitle: Text("movies/tv shows",style: TextStyle(color: Colors.white),),
         ),
       ),
       Container(
         height: MediaQuery.of(context).size.height*.60,
         width: double.infinity,
         decoration: BoxDecoration(
             image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1554050857-c84a8abdb5e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmxhY2t8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",

             ),fit: BoxFit.cover)
         ),
       )
     ],),
   )




     ///
  //body: ,

    );
  }
}
//https://api.themoviedb.org/3/search/movie?api_key=55c72b3a0898da6b37311cf0603659e2&language=en-US&query=&page=1&include_adult=false

