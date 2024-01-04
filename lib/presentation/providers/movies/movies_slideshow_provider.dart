import 'package:cine_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMoovies = ref.watch(nowPlayingMoviesProviders);

  if (nowPlayingMoovies.isEmpty) return [];

  return nowPlayingMoovies.sublist(0, 6);
});
