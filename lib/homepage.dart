import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/provider/provider.dart';
import 'package:providersapi/secondpage.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final String imageurl = "https://image.tmdb.org/t/p/w500/";

  get GoogleFonts => null;
  @override
  void initState() {
    final provider = Provider.of<ProviderItems>(context, listen: false);
    provider.buildProviderTrending(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderItems>(context);
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 4,
          toolbarHeight: 20,
          title: Text("Trending Movies",
              style: TextStyle(color: Colors.redAccent, fontFamily: "title")),
          backgroundColor: Colors.black,
          actions: [
            Icon(
              Icons.slow_motion_video_rounded,
              size: 20,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.2,
            )
          ],
        ),
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            provider.buildProviderTrending(context);
          },
          child: Icon(Icons.refresh),
        ),
        body: provider.loading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(
                    top: 3.0, bottom: 8, left: 8, right: 8),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                    itemCount: provider.trendingModel.results!.length,
                    itemBuilder: (ctx, index) {
                      return Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => ScreenTwo(
                                        id: provider
                                            .trendingModel.results![index].id
                                            .toString())));
                              },
                              child: provider.trendingModel.results![index]
                                          .posterPath !=
                                      null
                                  ? Card(
                                      elevation: 20,
                                      shadowColor: Colors.red,
                                      child: Image.network(
                                        imageurl +
                                            provider.trendingModel
                                                .results![index].posterPath
                                                .toString(),
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : SizedBox(),
                            ),
                          ),
                          provider.trendingModel.results![index].title != null
                              ? Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                      provider
                                          .trendingModel.results![index].title
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11)),
                                )
                              : SizedBox(),
                        ],
                      );
                    }),
              ));
  }
}
