import 'package:flutter/cupertino.dart';
import 'package:providersapi/repository/api/SearchMovieModel.dart';
import 'package:providersapi/repository/api/apiitem.dart';

class SearchMovieProvider with ChangeNotifier{
  AllApi allApi = AllApi();
  SearchMovieModel searchMovieModel = SearchMovieModel();
  bool loading = true;
  searchMovieWork(context, String moviename)async{
    loading = true;
    searchMovieModel =await allApi.searchMovie(moviename: moviename);
    loading = false;
    notifyListeners();
  }
}