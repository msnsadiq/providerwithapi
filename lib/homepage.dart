import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersapi/provider/provider.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final String imageurl = "https://image.tmdb.org/t/p/w500/";
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  provider.buildProviderTrending(context);
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: provider.loading
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: provider.trendingModel.results!.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Image.network(imageurl +
                        provider.trendingModel.results![index].posterPath
                            .toString()),
                  );
                }));
  }
}
