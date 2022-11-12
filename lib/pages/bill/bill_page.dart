import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_page.dart';
import 'package:household_expenses_app/common/common_const.dart';
import 'package:household_expenses_app/pages/bill/bill_view_model.dart';

class BillPage extends StatelessWidget with BasePage {
  const BillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = LocaleString.bill.tr();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final pageState = ref.watch(billViewModelProvider).pageState;
          return initBody(
            pageState: pageState,
            normalBody: Center(
              child: Text(title),
            ),
          );
        },
      ),
    );
  }
}
