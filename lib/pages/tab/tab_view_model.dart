import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_view_model.dart';
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
    TabModel('home', const Icon(Icons.home_outlined)),
    TabModel('bill', const Icon(Icons.event_note)),
    TabModel('report', const Icon(Icons.monitor_heart_outlined)),
    TabModel('profile', const Icon(Icons.person_outline)),
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
