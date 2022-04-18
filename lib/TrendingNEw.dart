import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:providersapi/repository/api/TrendingModel.dart';
import 'package:providersapi/repository/trending_movie_bloc.dart';
import 'package:providersapi/repository/trending_movie_bloc.dart';

class TrendingNew extends StatefulWidget {
  const TrendingNew({Key? key}) : super(key: key);

  @override
  State<TrendingNew> createState() => _TrendingNewState();
}

class _TrendingNewState extends State<TrendingNew>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    BlocProvider.of<TrendingMovieBloc>(context).add(FetchTrendingMovies());
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 late TrendingModel trendingModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
      builder: (context, state) {

        if(state is TrendingMovieLoading){
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if(state is TrendingMovieLoaded){
          return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ), itemBuilder: (context,index){
            return Text(trendingModel.results![index].title.toString());
          });
        }

        if(state is TrendingMovieError){
          return Center(
            child: Text('Something went wrong'),
          );
        }

        return Center(
          child: Text('Something went'),
        );

      },
    );
  }
}
