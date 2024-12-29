import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/ui/detail/detail_view.dart';
import 'package:karbonizma/ui/home/view/home_view.dart';

class AppRouter {
  //params
  static String detailsPath = '/detail/:id';
  static String homePath = '/';

  static final GoRouter router = GoRouter(
    initialLocation: homePath,
    routes: <GoRoute>[
      GoRoute(
        path: homePath,
        builder: (BuildContext context, GoRouterState state) => HomeView(),
      ),
      GoRoute(
        path: detailsPath,
        builder: (BuildContext context, GoRouterState state) {
          final id = int.parse(state.pathParameters['id']!);
          return DetailView(
            id: id,
          );
        },
      ),
    ],
  );
}
