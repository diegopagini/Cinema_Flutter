import 'package:dio/dio.dart';
import 'package:cine_app/config/constants/environment.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/domain/datasources/movies_datasource.dart';

class MoviedbDatasourceImpl extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'en-gb'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = dio.get('/movie/now_playing&page=$page');
    final List<Movie> movies = [];

    return [];
  }
}
