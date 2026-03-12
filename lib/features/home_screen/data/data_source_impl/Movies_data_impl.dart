import 'package:movies/core/network/api_manager.dart';
import 'package:movies/features/home_screen/data/data_source/movies_data.dart';
import 'package:movies/features/home_screen/data/models/Movie_response_model.dart';

class MoviesDataImpl implements MoviesData {
  final ApiManager apiManager;

  MoviesDataImpl(this.apiManager);

  @override
  Future<MovieResopnseModel> fetchMovies() async {
    return await apiManager.getMovies();
  }
}
