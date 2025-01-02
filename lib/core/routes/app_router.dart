import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/ui/detail/view/detail_view.dart';
import 'package:karbonizma/ui/greeting/view/greeting_view.dart';
import 'package:karbonizma/ui/home/view/home_view.dart';

class AppRouter {
  //params
  static String detailsPath = '/detail/:id';
  static String greetingPath = '/congrats/:id/:waste';
  static String homePath = '/';

  static final GoRouter router = GoRouter(
    initialLocation: homePath,
    routes: <GoRoute>[
      /// Home Page
      GoRoute(
        path: homePath,
        builder: (BuildContext context, GoRouterState state) => HomeView(),
      ),

      /// Details Page
      GoRoute(
        path: detailsPath,
        builder: (BuildContext context, GoRouterState state) {
          final id = int.parse(state.pathParameters['id']!);
          return DetailView(
            id: id,
          );
        },
      ),

      /// Greeting Page
      GoRoute(
        path: greetingPath,
        builder: (BuildContext context, GoRouterState state) {
          final id = int.parse(state.pathParameters['id']!);
          final waste = int.parse(state.pathParameters['waste']!);
          return GreetingView(id: id, waste: waste);
        },
      ),
    ],
  );
}
