import 'package:flutter/material.dart';
import 'package:nomo_router/router/entities/route.dart';
import 'package:nomo_ui_kit/components/app/scaffold/nomo_scaffold.dart';
import 'package:nomo_ui_kit/nomo_ui_kit_base.dart';
import 'package:route_gen/anotations.dart';
import 'package:swap_theme_webon/pages/home.dart';

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
  NestedPageRouteInfo(
    wrapper: wrapper,
    children: [
      MenuPageRouteInfo(path: "/", page: HomeScreen, title: "Home"),
    ],
  )
];
