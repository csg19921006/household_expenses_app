import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_page.dart';
import 'package:household_expenses_app/common/common_const.dart';
import 'package:household_expenses_app/pages/second/second_page_view_model.dart';

class SecondPage extends StatelessWidget with BasePage {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.secondPageTitle),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final pageState = ref.watch(secondPageViewModelProvider).pageState;
          return initBody(
            pageState: pageState,
            normalBody: const Center(
              child: Text('secondPage'),
            ),
          );
        },
      ),
    );
  }
}
