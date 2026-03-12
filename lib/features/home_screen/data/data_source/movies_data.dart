import 'package:movies/features/home_screen/data/models/Movie_response_model.dart';

abstract class MoviesData {
  Future<MovieResopnseModel> fetchMovies();
}
