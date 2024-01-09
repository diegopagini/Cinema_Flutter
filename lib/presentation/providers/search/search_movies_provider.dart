import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchedMoviesNotifier(ref,
      searchMovies: movieRepository.getMoviesByTerm);
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(
    {required String movie});

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMoviesNotifier(this.ref, {required this.searchMovies}) : super([]);

  Future<List<Movie>> searchMoviesByQuery({required String movie}) async {
    ref.read(searchQueryProvider.notifier).update((state) => movie);
    final List<Movie> movies = await searchMovies(movie: movie);

    state = movies;

    return movies;
  }
}
