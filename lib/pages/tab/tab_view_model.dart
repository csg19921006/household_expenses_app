import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_view_model.dart';
import 'package:household_expenses_app/common/common_const.dart';
import 'package:household_expenses_app/pages/bill/bill_page.dart';
import 'package:household_expenses_app/pages/home/home_page.dart';
import 'package:household_expenses_app/pages/profile/profile_page.dart';
import 'package:household_expenses_app/pages/report/report_page.dart';
import 'package:household_expenses_app/pages/tab/tab_model.dart';

final tabChangeNotifierProvider =
    ChangeNotifierProvider.autoDispose<TabViewModel>((ref) {
  return TabViewModel();
});

class TabViewModel extends BaseViewModel {
  final tabModelList = [
    TabModel(LocaleString.home.tr(), const Icon(Icons.home_outlined)),
    TabModel(LocaleString.bill.tr(), const Icon(Icons.event_note)),
    TabModel(
        LocaleString.report.tr(), const Icon(Icons.monitor_heart_outlined)),
    TabModel(LocaleString.profile.tr(), const Icon(Icons.person_outline)),
  ];
  final tabPageList = [
    const HomePage(),
    const BillPage(),
    const ReportPage(),
    const ProfilePage(),
  ];

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(value) {
    _currentIndex = value;
    notifyListeners();
  }
}
