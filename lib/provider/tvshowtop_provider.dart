import 'package:flutter/foundation.dart';
import 'package:providersapi/repository/api/TvShowTopRatedModel.dart';
import 'package:providersapi/repository/api/api_client.dart';
import 'package:providersapi/repository/api/apiitem.dart';

class TvTopProvider with ChangeNotifier {
  TvShowTopRatedModel tvShowTopRatedModel = TvShowTopRatedModel();
  AllApi allApi = AllApi();
  bool loading = false;
  getTvTopItems(context) async {
    loading = true;
    tvShowTopRatedModel = await allApi.tvShowtopRated();
    loading = false;
    notifyListeners();
  }
}
