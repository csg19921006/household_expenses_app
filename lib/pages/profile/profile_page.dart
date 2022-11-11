import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_page.dart';
import 'package:household_expenses_app/common/common_const.dart';
import 'package:household_expenses_app/pages/profile/profile_view_model.dart';

class ProfilePage extends StatelessWidget with BasePage {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.profilePageTitle),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final pageState = ref.watch(profileViewModelProvider).pageState;
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
