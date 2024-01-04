import 'package:dio/dio.dart';
import 'package:cine_app/infrastructure/mappers/movie_mapper.dart';
import 'package:cine_app/infrastructure/models/moviedb/movie_db_response.dart';
import 'package:cine_app/config/constants/environment.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/domain/datasources/movies_datasource.dart';

class MoviedbDatasourceImpl extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-ES'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // Get response from http.
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    // Transform that json response into a map.
    final movieDBReponse = MovieDBResponse.fromJson(response.data);
    // Transform that map into one with the structure that we want.
    final List<Movie> movies = movieDBReponse.results
        // To filter the movies without image.
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    // Return that data.
    return movies;
  }
}
