import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/core/routes/app_routing.dart';
import 'core/routes/routes.dart';
import 'core/theme/colors_helper.dart';
import 'feature/home/home_screen.dart';

void main() {
  runApp(
      ProviderScope(
        child: MyApp(
            routing: AppRouting(),
          ),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routing});
  final AppRouting routing;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: ColorsManager.background),
      initialRoute: Routes.home,
      onGenerateRoute: routing.generateRouting,
    );
  }
}
