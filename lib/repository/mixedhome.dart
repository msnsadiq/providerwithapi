import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/homepage.dart';
import 'package:providersapi/moviesuggestpage/moviesuggest.dart';
import 'package:providersapi/provider/searchProvider.dart';
import 'package:providersapi/repository/tvshowpage.dart';
import 'package:providersapi/secondpage.dart';
import 'package:providersapi/tvDetailsPage/tvDetailPage.dart';

import '../provider/provider.dart';
import '../provider/tvshowtop_provider.dart';

class MixedOpenPage extends StatefulWidget {
  const MixedOpenPage({Key? key}) : super(key: key);

  @override
  State<MixedOpenPage> createState() => _MixedOpenPageState();
}

class _MixedOpenPageState extends State<MixedOpenPage> {
  final String imageurl = "https://image.tmdb.org/t/p/w500/";
  @override
  void initState() {
    final tvtopprovider = Provider.of<TvTopProvider>(context, listen: false);
    tvtopprovider.getTvTopItems(context);
    final provider = Provider.of<ProviderItems>(context, listen: false);
    provider.buildProviderTrending(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tvtopprovider = Provider.of<TvTopProvider>(context);
    final provider = Provider.of<ProviderItems>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "TMDB",
            style: TextStyle(
              color: Colors.red,
              fontFamily: "title",
            ),
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  //showSearch(context: context, delegate: DataSearch());
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MovieSuggest()));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.red,
                ))
          ],
        ),
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints){
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListTile(
                      title: Text(
                        "Tv Shows",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => TvShow()));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                            size: 15,
                          )),
                    ),
                    SizedBox(
                      height: 200,
                      //color: Colors.yellow,
                      child: tvtopprovider.loading
                          ? Center(
                        child: CircularProgressIndicator(),
                      )
                          : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tvtopprovider
                              .tvShowTopRatedModel.results!.length,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (ctx) => TvDetailPage(
                                            id: tvtopprovider
                                                .tvShowTopRatedModel
                                                .results![index]
                                                .id
                                                .toString())));
                              },
                              child: Card(
                                elevation: 20,
                                shadowColor: Colors.red,
                                child: Image.network(
                                  imageurl +
                                      tvtopprovider.tvShowTopRatedModel
                                          .results![index].posterPath
                                          .toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          }),
                    ),
                    ListTile(
                      title: Text(
                        "Movies",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => ScreenHome()));
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    provider.loading
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        : GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            // scrollDirection: Axis.vertical,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5),
                            itemCount:
                            provider.trendingModel.results!.length,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (ctx) => ScreenTwo(
                                              id: provider.trendingModel
                                                  .results![index].id
                                                  .toString())));
                                },
                                child: Card(
                                  child: Image.network(
                                    imageurl +
                                        provider.trendingModel
                                            .results![index].posterPath
                                            .toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }),
                   
                  ],
                ),
              ),
            );
          },

        ));
  }
}
