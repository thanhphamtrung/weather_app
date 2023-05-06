import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../views/search_view.dart';

class AppRouter {
  static String homeScreen = '/';
  static String searchScreen = 'search';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'search',
            builder: (BuildContext context, GoRouterState state) {
              return const SearchView();
            },
          ),
        ],
      ),
    ],
  );
}
