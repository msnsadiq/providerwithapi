import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/provider/provider.dart';

class ScreenTwo extends StatefulWidget {
   ScreenTwo({Key? key,required this.id}) : super(key: key);
String id;
  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final String imageurl = "https://image.tmdb.org/t/p/w500/";

  @override
  void initState() {
    final providerItem = Provider.of<ProviderItems>(context,listen: false);
    providerItem.builProviderMovieId(context, widget.id);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final providerItem = Provider.of<ProviderItems>(context);
    return Scaffold(
      backgroundColor: Colors.black,
    body: providerItem.loading ? Center(child: CircularProgressIndicator(),):
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(imageurl + providerItem.movieIdModel.posterPath.toString()))
          ),
        )

    );
  }
}
