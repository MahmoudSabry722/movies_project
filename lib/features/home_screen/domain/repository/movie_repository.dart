import 'package:movies/features/home_screen/domain/entity/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getPopularMovies();
}
