import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nomo_router/nomo_router.dart';
import 'package:nomo_router/router/entities/route.dart';
import 'package:nomo_ui_kit/components/app/scaffold/nomo_scaffold.dart';
import 'package:route_gen/anotations.dart';
import 'package:zeniq_swap_frontend/pages/home.dart';

part 'routes.g.dart';

Widget wrapper(nav) {
  return Builder(
    builder: (context) {
      return NomoScaffold(
        child: nav,
      );
    },
  );
}

@AppRoutes()
const _routes = [
  NestedNavigator(
    wrapper: wrapper,
    key: ValueKey("main"),
    children: [
      MenuPageRouteInfo(path: "/", page: HomeScreen, title: "Home"),
    ],
  )
];
