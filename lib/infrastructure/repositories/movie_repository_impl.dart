import 'package:cine_app/domain/datasources/movies_datasource.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  // This is done this way so that you can change the data source in an easy way.
  final MoviesDatasource datasource;

  MovieRepositoryImpl({required this.datasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<List<Movie>> topRated({int page = 1}) {
    return datasource.topRated(page: page);
  }

  @override
  Future<Movie> getMovieById({required String id}) {
    return datasource.getMovieById(id: id);
  }

  @override
  Future<List<Movie>> getMoviesByTerm({required String movie}) {
    return datasource.getMoviesByTerm(movie: movie);
  }
}
