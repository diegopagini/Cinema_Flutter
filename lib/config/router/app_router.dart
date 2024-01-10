import 'package:go_router/go_router.dart';
import 'package:cine_app/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = state.pathParameters['page'] ?? '0';

        return HomeScreen(
          pageIndex: int.parse(pageIndex),
        );
      },
      // Children routes
      routes: [
        GoRoute(
            path: 'movie/:id',
            name: MovieScreen.name,
            builder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no-id';

              return MovieScreen(movieId: movieId);
            }),
      ]),
  GoRoute(path: '/', redirect: (_, __) => '/home/0')
]);

// final appRouter = GoRouter(initialLocation: '/', routes: [
//   // Shell route to use bottomNavigationBar
//   ShellRoute(
//       builder: (context, state, child) {
//         return HomeScreen(childView: child);
//       },
//       routes: [
//         GoRoute(
//             path: '/',
//             builder: (context, state) => const HomeView(),
//             routes: [
//               GoRoute(
//                   path: 'movie/:id',
//                   name: MovieScreen.name,
//                   builder: (context, state) {
//                     final movieId = state.pathParameters['id'] ?? 'no-id';

//                     return MovieScreen(movieId: movieId);
//                   }),
//             ]),
//         GoRoute(
//           path: '/favorites',
//           builder: (context, state) => const FavoritesView(),
//         ),
//         GoRoute(
//           path: '/categories',
//           builder: (context, state) => const CategoriesView(),
//         )
//       ])
// ]);
