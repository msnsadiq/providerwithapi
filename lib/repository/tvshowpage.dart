import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/provider/tvshowtop_provider.dart';

class TvShow extends StatefulWidget {
  const TvShow({Key? key}) : super(key: key);

  @override
  State<TvShow> createState() => _TvShowState();
}

class _TvShowState extends State<TvShow> {
  final String imageurl = "https://image.tmdb.org/t/p/w500/";
  @override
  void initState() {
    final tvtopprovider = Provider.of<TvTopProvider>(context, listen: false);
    tvtopprovider.getTvTopItems(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tvtopprovider = Provider.of<TvTopProvider>(context);
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: tvtopprovider.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: tvtopprovider.tvShowTopRatedModel.results!.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Image.network(imageurl +
                        tvtopprovider
                            .tvShowTopRatedModel.results![index].posterPath
                            .toString()),
                  );
                }));
  }
}
