import 'package:dio/dio.dart';
import 'package:cine_app/infrastructure/mappers/movie_mapper.dart';
import 'package:cine_app/infrastructure/models/moviedb/movie_db_response.dart';
import 'package:cine_app/config/constants/environment.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/domain/datasources/movies_datasource.dart';
import 'package:cine_app/infrastructure/models/moviedb/movie_details.dart';

class MoviedbDatasourceImpl extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'en-EN'
      }));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBReponse = MovieDBResponse.fromJson(json);
    final List<Movie> movies = movieDBReponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }

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

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> topRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById({required String id}) async {
    final response = await dio.get('/movie/$id');

    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }

    final movieDetails = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }

  @override
  Future<List<Movie>> getMoviesByTerm({required String movie}) async {
    if (movie.isEmpty) return [];

    final response =
        await dio.get('/search/movie', queryParameters: {'query': movie});

    return _jsonToMovies(response.data);
  }
}
