import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/domain/datasources/local_storage_datasource.dart';
import 'package:cine_app/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatsource datasource;

  LocalStorageRepositoryImpl({required this.datasource});

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
}
