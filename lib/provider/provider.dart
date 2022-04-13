import 'package:flutter/foundation.dart';
import 'package:providersapi/repository/api/TrendingModel.dart';
import 'package:providersapi/repository/api/apiitem.dart';

class ProviderItems with ChangeNotifier {
  TrendingModel trendingModel = TrendingModel();
  AllApi allApi = AllApi();
  bool loading = false;
  buildProviderTrending(context) async {
    loading = true;
    trendingModel = await allApi.trendingApi();

    loading = false;
    notifyListeners();
  }
}
