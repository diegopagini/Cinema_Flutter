import 'package:cine_app/config/helpers/day_format.dart';
import 'package:flutter/material.dart';
import 'package:cine_app/presentation/providers/providers.dart';
import 'package:cine_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    // To do the first call
    ref.read(nowPlayingMoviesProviders.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProviders);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        automaticallyImplyLeading: false,
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MoviesSlideshow(movies: slideShowMovies),
            MovieHorizontalListview(
              label: 'In theaters',
              subLabel: DayFormat.getDay(DateTime.now()),
              movies: nowPlayingMovies,
              loadNextPage: () {
                ref.read(nowPlayingMoviesProviders.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListview(
              label: 'Popular',
              movies: popularMovies,
              loadNextPage: () {
                ref.read(popularMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListview(
              label: 'This month',
              movies: slideShowMovies,
            ),
            MovieHorizontalListview(
              label: 'Soon',
              movies: slideShowMovies,
            ),
            MovieHorizontalListview(
              label: 'Best rated',
              movies: slideShowMovies,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      }, childCount: 1))
    ]);
  }
}
