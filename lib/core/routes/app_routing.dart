import 'package:flutter/material.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/feature/home/data/model/move_model.dart';
import 'package:movies/feature/home/see_all_screen.dart';
import 'package:movies/feature/search/ui/search_screen.dart';
import '../../feature/details/ui/details_screen.dart';
import '../../feature/home/home_screen.dart';

class AppRouting {
  Route? generateRouting(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
    switch (settings.name) {
      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
    }
    switch (settings.name) {
      case Routes.seeAll:
        return MaterialPageRoute(builder: (_) => const SeeAllScreen());
    }
    switch (settings.name) {
      case Routes.details:
        final args = settings.arguments as MoveModel;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(moveModel: args ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Center(
            child: Text('no router founding ${settings.name}'),
          ),
        );
    }
  }
}
