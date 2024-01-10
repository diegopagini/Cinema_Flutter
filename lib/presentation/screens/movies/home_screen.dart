import 'package:cine_app/presentation/views/movies/categories_view.dart';
import 'package:cine_app/presentation/views/movies/favotires_view.dart';
import 'package:flutter/material.dart';
import 'package:cine_app/presentation/views/movies/home_view.dart';
import 'package:cine_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({
    super.key,
    required this.pageIndex,
  });

  final viewRoutes = const <Widget>[
    HomeView(),
    CategoriesView(),
    FavoritesView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To keep alive
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: pageIndex),
    );
  }
}
