import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/provider/tvshowtop_provider.dart';
import 'package:providersapi/tvDetailsPage/tvDetailPage.dart';

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
        appBar: AppBar(
          leadingWidth: 4,
          toolbarHeight: 20,
          title: const Text("Popular Shows",
              style: TextStyle(color: Colors.redAccent, fontFamily: "title")),
          backgroundColor: Colors.black,
          actions: [
            const Icon(
              Icons.tv,
              size: 20,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.2,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            tvtopprovider.getTvTopItems(context);
          },
          child: Icon(
            Icons.refresh,
          ),
        ),
        backgroundColor: Colors.black,
        body: tvtopprovider.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.only(
                    top: 3.0, bottom: 8, left: 8, right: 8),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                    itemCount:
                        tvtopprovider.tvShowTopRatedModel.results!.length,
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
                                    builder: (ctx) => TvDetailPage(
                                        id: tvtopprovider.tvShowTopRatedModel
                                            .results![index].id
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
                            ),
                          ),
                          tvtopprovider.tvShowTopRatedModel.results![index]
                                      .name !=
                                  null
                              ? Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                      tvtopprovider.tvShowTopRatedModel
                                          .results![index].name
                                          .toString(),
                                      style: GoogleFonts.michroma(
                                        color: Colors.white,
                                        fontSize: 11,
                                      )),
                                )
                              : Container(),
                        ],
                      );
                    }),
              ));
  }
}
