import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:household_expenses_app/common/common_const.dart';
import 'package:household_expenses_app/pages/home/home_page.dart';
import 'package:household_expenses_app/pages/second/second_page.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: AppString.appTitle,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppPagePath.home,
        name: AppPageName.home,
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
        routes: <GoRoute>[
          GoRoute(
            path: AppPagePath.second,
            name: AppPageName.second,
            builder: (BuildContext context, GoRouterState state) =>
                const SecondPage(),
          ),
        ],
      ),
    ],
  );
}
