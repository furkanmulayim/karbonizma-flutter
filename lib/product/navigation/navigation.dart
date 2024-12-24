import 'package:go_router/go_router.dart';
import 'package:karbonizma/feature/greeting/greeting_view.dart';
import 'package:karbonizma/feature/hello/hello_view.dart';
import 'package:karbonizma/feature/list/list_view.dart';
import 'package:karbonizma/feature/menu/menu_view.dart';
import 'package:karbonizma/feature/recycle/recycle_view.dart';

///
class AppRoutes {
  ///
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HelloView(),
      ),
      GoRoute(
        path: '/menu',
        builder: (context, state) => const MenuView(),
      ),
       GoRoute(
        path: '/list',
        builder: (context, state) => const ListViewPage(),
      ),
      GoRoute(
        path: '/recycle/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return RecycleView(id: id);
        },
      ),
      GoRoute(
        path: '/greeting/:id/:waste',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          final waste = int.parse(state.pathParameters['waste']!);
          return GreetingView(id: id, waste: waste);
        },
      ),
    ],
  );
}
