import 'package:movies/features/home_screen/data/data_source/movies_data.dart';
import 'package:movies/features/home_screen/domain/entity/movie_entity.dart';
import 'package:movies/features/home_screen/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MoviesData moviesData;

  MovieRepositoryImpl(this.moviesData);

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    final response = await moviesData.fetchMovies();
    final List<MovieEntity> moviesList =
        response.data?.movies?.map((movieModel) {
          return MovieEntity(
            id: movieModel.id ?? 0,
            title: movieModel.title ?? "Unknown",
            posterImage: movieModel.mediumCoverImage ?? "",
            rating: movieModel.rating ?? 0,
            year: movieModel.year ?? 0,
          );
        }).toList() ??
        [];
    return moviesList;
  }
}
