import 'package:flutter/material.dart';
import 'package:cine_app/presentation/delegates/search_movie_delegate.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
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
                        showSearch(
                            context: context, delegate: SearchMovieDelegate());
                      },
                      icon: const Icon(Icons.search))
                ],
              )),
        ));
  }
}
