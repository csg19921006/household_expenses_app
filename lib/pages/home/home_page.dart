import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:household_expenses_app/base/base_page.dart';
import 'package:household_expenses_app/base/base_view_model.dart';
import 'package:household_expenses_app/common/common_const.dart';

class HomePage extends StatelessWidget with BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.homePageTitle),
      ),
      body: initBody(
        pageState: PageState.normal,
        normalBody: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppPageName.second);
              },
              child: const Text('push second page'),
            ),
          ],
        ),
      ),
    );
  }
}
