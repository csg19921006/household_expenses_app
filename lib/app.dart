import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:household_expenses_app/common/common_const.dart';
import 'package:household_expenses_app/pages/bill/bill_page.dart';
import 'package:household_expenses_app/pages/category/category_page.dart';
import 'package:household_expenses_app/pages/home/home_page.dart';
import 'package:household_expenses_app/pages/input/input_page.dart';
import 'package:household_expenses_app/pages/tab/tab_page.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: AppString.appTitle,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primaryColor: AppColor.buttonBackground,
        colorScheme: const ColorScheme.light(
          primary: AppColor.buttonBackground,
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
          GoRoute(
            path: AppPagePath.input,
            name: AppPageName.input,
            pageBuilder: (context, state) =>
                const MaterialPage(fullscreenDialog: true, child: InputPage()),
            routes: [
              GoRoute(
                path: AppPagePath.category,
                name: AppPageName.category,
                builder: (BuildContext context, GoRouterState state) =>
                    const CategoryPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
