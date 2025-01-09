import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/ui/detail/view/detail_view.dart';
import 'package:karbonizma/ui/history/view/history_view.dart';
import 'package:karbonizma/ui/home/view/home_view.dart';
import 'package:karbonizma/ui/rewards/view/rewards_view.dart';

class AppRouter {
  //params
  static String detailsPath = '/detail/:id';
  static String historyPath = '/history';
  static String homePath = '/';
  static String rewardsPath = '/rewards';

  static final GoRouter router = GoRouter(
    initialLocation: homePath,
    routes: <GoRoute>[
      /// Home Page
      GoRoute(
        path: homePath,
        builder: (BuildContext context, GoRouterState state) => HomeView(),
      ),

      /// History Page
      GoRoute(
        path: historyPath,
        builder: (BuildContext context, GoRouterState state) => HistoryView(),
      ),

      /// Rewards Page
      GoRoute(
        path: rewardsPath,
        builder: (BuildContext context, GoRouterState state) => RewardsView(),
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
    ],
  );
}
