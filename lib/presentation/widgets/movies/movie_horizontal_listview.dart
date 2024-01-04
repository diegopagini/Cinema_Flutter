import 'package:animate_do/animate_do.dart';
import 'package:cine_app/config/helpers/human_formats.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? label;
  final String? subLabel;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.label,
      this.subLabel,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(children: [
        if (label != null || subLabel != null)
          _Title(
            title: label,
            subTitle: subLabel,
          ),
        Expanded(
            child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return _Slide(movie: movies[index]);
          },
        ))
      ]),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subTitle!),
            )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // IMAGE
        SizedBox(
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
              width: 150,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2)));
                }

                return FadeIn(child: child);
              },
            ),
          ),
        ),

        const SizedBox(
          height: 5,
        ),

        // TITLE
        SizedBox(
          width: 150,
          child: Text(
            movie.title,
            maxLines: 2,
            style: textStyle.titleSmall,
          ),
        ),

        // RATING
        Row(
          children: [
            Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
            const SizedBox(width: 5),
            Text(
              HumanFormats.humanRedableNumber(movie.voteAverage),
              style:
                  textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade900),
            ),
            const SizedBox(width: 10),
            Text(
              HumanFormats.humanRedableNumber(movie.popularity),
              style: textStyle.bodySmall,
            )
          ],
        )
      ]),
    );
  }
}
