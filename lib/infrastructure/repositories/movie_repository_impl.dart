import 'package:cine_app/domain/datasources/movies_datasource.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  // This is done this way so that you can change the data source in an easy way.
  final MoviesDatasource datasource;

  MoviesRepositoryImpl({required this.datasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
