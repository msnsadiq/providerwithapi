import 'dart:convert';

import 'package:http/http.dart';
import 'package:providersapi/repository/api/MovieIdModel.dart';
import 'package:providersapi/repository/api/SearchMovieModel.dart';
import 'package:providersapi/repository/api/TrendingModel.dart';
import 'package:providersapi/repository/api/TvShowTopRatedModel.dart';
import 'package:providersapi/repository/api/api_client.dart';

class AllApi {
  MainHall mainHall = MainHall();
  final String pathdefines = 'trending/all/day';
  final String pathdefinesid = 'movie/';
  final String pathtvtop = 'tv/top_rated';

  Future<TrendingModel> trendingApi() async {
    Response response = await mainHall.FetchFunc(
        urldiffrent: true, pathitem: pathdefines, method: "GET", body: null);
    return TrendingModel.fromJson(json.decode(response.body));
  }

  Future<MovieIdModel> movieIdApi({required String id}) async {
    Response response = await mainHall.FetchFunc(
        urldiffrent: true,
        pathitem: pathdefinesid + id,
        method: "GET",
        body: null);
    return MovieIdModel.fromJson(json.decode(response.body));
  }

  Future<SearchMovieModel> searchMovie({required String moviename}) async {
    Response response = await mainHall.FetchFunc(
        urldiffrent: false, pathitem: moviename, method: "GET", body: null);
    return SearchMovieModel.fromJson(json.decode(response.body));
  }

  Future<TvShowTopRatedModel> tvShowtopRated() async {
    Response response = await mainHall.FetchFunc(
        pathitem: pathtvtop, method: "GET", body: null, urldiffrent: true);
    return TvShowTopRatedModel.fromJson(json.decode(response.body));
  }
}
