import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/pages/tab/tab_view_model.dart';

class TapPage extends StatelessWidget {
  const TapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final list = ref.watch(tabChangeNotifierProvider).tabModelList;
      final pageList = ref.watch(tabChangeNotifierProvider).tabPageList;
      final currentIndex = ref.watch(tabChangeNotifierProvider).currentIndex;
      return Scaffold(
        body: pageList[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          // unselectedLabelStyle: const TextStyle(color: Colors.black),
          // selectedLabelStyle: const TextStyle(color: Colors.orange),
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (index) {
            ref.read(tabChangeNotifierProvider).currentIndex = index;
          },
          items: list
              .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.title))
              .toList(),
        ),
      );
    });
  }
}
