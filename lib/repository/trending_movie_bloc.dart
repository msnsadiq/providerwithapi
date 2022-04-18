import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:providersapi/repository/api/TrendingModel.dart';
import 'package:providersapi/repository/api/apiitem.dart';

part 'trending_movie_event.dart';
part 'trending_movie_state.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {

  late TrendingModel trendingModel ;
  AllApi allApi;
  TrendingMovieBloc(this.allApi) : super(TrendingMovieInitial()) {

  }
  @override
  Stream<TrendingMovieState> mapEventToState(
      TrendingMovieEvent event) async* {


        try {
        
        } catch (e) {

        }

    }
  }


