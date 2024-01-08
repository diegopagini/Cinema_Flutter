import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cine_app/domain/entities/movie.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(
    {required String movie});

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({required this.searchMovies});

  @override
  String get searchFieldLabel => 'Search Movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        FadeInRight(
            child: IconButton(
                onPressed: () => query = '', icon: const Icon(Icons.clear)))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(movie: query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
            );
          },
        );
      },
    );
  }
}
