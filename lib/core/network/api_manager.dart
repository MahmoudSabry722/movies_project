import 'package:dio/dio.dart';
import 'package:movies/core/constants/app_constants.dart';

import '../../features/home_screen/data/models/Movie_response_model.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
  }

  Future<MovieResopnseModel> getMovies() async {
    var response = await dio.get(
      AppConstants.moviesEndPoint,
      queryParameters: {"limit": "50", "page": "1"},
    );
    return MovieResopnseModel.fromJson(response.data);
  }
}
