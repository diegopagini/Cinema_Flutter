import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/presentation/widgets/movies/movie_poster_link.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MovieMansonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallbackAction? loadNextPage;

  const MovieMansonry({super.key, required this.movies, this.loadNextPage});

  @override
  State<MovieMansonry> createState() => _MovieMansonryState();
}

class _MovieMansonryState extends State<MovieMansonry> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                MoviePosterLink(movie: widget.movies[index]),
              ],
            );
          }

          return MoviePosterLink(movie: widget.movies[index]);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
