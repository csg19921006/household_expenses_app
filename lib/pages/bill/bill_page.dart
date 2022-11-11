import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_page.dart';
import 'package:household_expenses_app/common/common_const.dart';
import 'package:household_expenses_app/pages/bill/bill_view_model.dart';

class BillPage extends StatelessWidget with BasePage {
  const BillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.billPageTitle),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final pageState = ref.watch(billViewModelProvider).pageState;
          return initBody(
            pageState: pageState,
            normalBody: const Center(
              child: Text('BillPage'),
            ),
          );
        },
      ),
    );
  }
}
