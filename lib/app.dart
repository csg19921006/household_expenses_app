import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:household_expenses_app/common/common_const.dart';
import 'package:household_expenses_app/pages/bill/bill_page.dart';
import 'package:household_expenses_app/pages/home/home_page.dart';
import 'package:household_expenses_app/pages/tab/tab_page.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: AppString.appTitle,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.orange,
        ),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppPagePath.tab,
        name: AppPageName.tab,
        builder: (BuildContext context, GoRouterState state) => const TapPage(),
        routes: <GoRoute>[
          GoRoute(
            path: AppPagePath.home,
            name: AppPageName.home,
            builder: (BuildContext context, GoRouterState state) =>
                const HomePage(),
          ),
          GoRoute(
            path: AppPagePath.bill,
            name: AppPageName.bill,
            builder: (BuildContext context, GoRouterState state) =>
                const BillPage(),
          ),
          GoRoute(
            path: AppPagePath.report,
            name: AppPageName.report,
            builder: (BuildContext context, GoRouterState state) =>
                const BillPage(),
          ),
          GoRoute(
            path: AppPagePath.profile,
            name: AppPageName.profile,
            builder: (BuildContext context, GoRouterState state) =>
                const BillPage(),
          ),
        ],
      ),
    ],
  );
}
