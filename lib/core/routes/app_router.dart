import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/ui/detail/view/detail_view.dart';
import 'package:karbonizma/ui/history/view/history_view.dart';
import 'package:karbonizma/ui/home/view/home_view.dart';
import 'package:karbonizma/ui/privacy/view/privacy_view.dart';
import 'package:karbonizma/ui/rewards/view/rewards_view.dart';

class AppRouter {
  //params
  static String detailsPath = '/detail/:id';
  static String historyPath = '/history';
  static String homePath = '/';
  static String rewardsPath = '/rewards';
  static String privacyPath = '/privacy';

  static final GoRouter router = GoRouter(
    initialLocation: homePath,
    routes: <GoRoute>[
      /// Home Page
      GoRoute(
          path: homePath,
          builder: (BuildContext context, GoRouterState state) => HomeView(),
          routes: [
            GoRoute(
              path: historyPath,
              builder: (BuildContext context, GoRouterState state) =>
                  HistoryView(),
            ),
          ]),

      /// History Page

      /// Rewards Page
      GoRoute(
        path: rewardsPath,
        builder: (BuildContext context, GoRouterState state) => RewardsView(),
      ),

      /// Privacy Page
      GoRoute(
        path: privacyPath,
        builder: (BuildContext context, GoRouterState state) => PrivacyView(),
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
