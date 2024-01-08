import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:cine_app/presentation/delegates/search_movie_delegate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Icon(
                    Icons.movie_outlined,
                    color: colors.primary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Cine App',
                    style: titleStyle,
                  ),
                  const Spacer(), // This is like flex 1 1
                  IconButton(
                      onPressed: () {
                        final movieRepository =
                            ref.read(movieRepositoryProvider);

                        showSearch<Movie?>(
                            context: context,
                            delegate: SearchMovieDelegate(
                                searchMovies: movieRepository.getMoviesByTerm));
                      },
                      icon: const Icon(Icons.search))
                ],
              )),
        ));
  }
}
