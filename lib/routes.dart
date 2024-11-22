import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_theme_webon/pages/home.dart';
import 'package:swap_theme_webon/pages/select_predefined.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: "/predefined",
      builder: (BuildContext context, GoRouterState state) {
        return const SelectPredefinedScreen();
      },
    ),
  ],
);
