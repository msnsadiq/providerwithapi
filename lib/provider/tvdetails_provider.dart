import 'package:flutter/foundation.dart';
import 'package:providersapi/repository/api/apiitem.dart';

import '../repository/api/TvDetailModell.dart';

class TvDetailsProvider with ChangeNotifier {
  AllApi allApi = AllApi();
  TvDetailModell tvDetailModell = TvDetailModell();
  bool loading = false;
  tvDetailGet(context, String id) async {
    loading = true;
    tvDetailModell = await allApi.tvDetailByid(id);
    loading = false;
    notifyListeners();
  }
}
