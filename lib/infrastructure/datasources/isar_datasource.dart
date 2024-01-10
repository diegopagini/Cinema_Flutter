import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/domain/datasources/local_storage_datasource.dart';

class IsarDatasource extends LocalStorageDatsource {
  @override
  Future<bool> isMovieFavorite(int movieId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    throw UnimplementedError();
  }
}
