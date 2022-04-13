import 'package:flutter/foundation.dart';
import 'package:providersapi/repository/api/MovieIdModel.dart';
import 'package:providersapi/repository/api/TrendingModel.dart';
import 'package:providersapi/repository/api/apiitem.dart';

class ProviderItems with ChangeNotifier {
  TrendingModel trendingModel = TrendingModel();
  MovieIdModel movieIdModel = MovieIdModel();
  AllApi allApi = AllApi();
  bool loading = false;
  buildProviderTrending(context) async {
    loading = true;
    trendingModel = await allApi.trendingApi();

    loading = false;
    notifyListeners();
  }
  builProviderMovieId(context,String id)async{
    loading = true;
    movieIdModel =  await allApi.movieIdApi(id:id );
    loading = false;
    notifyListeners();
  }
}
