import 'package:http/http.dart';
import 'package:providersapi/repository/api/TrendingModel.dart';
import 'package:providersapi/repository/api/api_client.dart';

class AllApi {
  MainHall mainHall = MainHall();
  final String pathdefines = 'trending/all/day';
  Future<TrendingModel> trendingApi() async {
    Response response = await mainHall.FetchFunc(
        pathitem: pathdefines, method: "GET", body: null);
    return TrendingModel.fromJson(response.body);
  }
}
