import 'package:go_router/go_router.dart';
import 'package:cine_app/presentation/views/home_views/categories_view.dart';
import 'package:cine_app/presentation/screens/screens.dart';
import 'package:cine_app/presentation/views/home_views/home_view.dart';
import 'package:cine_app/presentation/views/home_views/favotires_view.dart';

//
//Regular Router
//final appRouter = GoRouter(initialLocation: '/', routes: [
//   GoRoute(
//       path: '/',
//       name: HomeScreen.name,
//       builder: (context, state) => const HomeScreen(
//             childView: FavoritesView(),
//           ),
//       // Children routes
//       routes: [
//         GoRoute(
//             path: 'movie/:id',
//             name: MovieScreen.name,
//             builder: (context, state) {
//               final movieId = state.pathParameters['id'] ?? 'no-id';

//               return MovieScreen(movieId: movieId);
//             }),
//       ]),
// ]);

final appRouter = GoRouter(initialLocation: '/', routes: [
  // Shell route to keep alive.
  ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => const HomeView(),
            routes: [
              GoRoute(
                  path: 'movie/:id',
                  name: MovieScreen.name,
                  builder: (context, state) {
                    final movieId = state.pathParameters['id'] ?? 'no-id';

                    return MovieScreen(movieId: movieId);
                  }),
            ]),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesView(),
        ),
        GoRoute(
          path: '/categories',
          builder: (context, state) => const CategoriesView(),
        )
      ])
]);
