import 'package:cine_app/infrastructure/datasources/moviedb_datasource_impl.dart';
import 'package:cine_app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [Provider] is to make a provider read-only.
final movieRepositoryProvider = Provider((ref) {
  // At this point we establish the data source.
  // Here we can change it to whatever we want. (Netflix, MovieDB, IMDB, etc.)
  return MovieRepositoryImpl(datasource: MoviedbDatasourceImpl());
});
