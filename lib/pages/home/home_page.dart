import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_page.dart';
import 'package:household_expenses_app/common/common_const.dart';
import 'package:household_expenses_app/pages/home/home_view_model.dart';

class HomePage extends StatelessWidget with BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = LocaleString.home.tr();
    return Consumer(
      builder: (context, ref, child) {
        final pageState = ref.watch(homeViewModelProvider).pageState;
        return initBody(
            pageState: pageState,
            normalBody: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        expandedHeight: 200.0,
                        stretch: true,
                        flexibleSpace: FlexibleSpaceBar(
                          stretchModes: const [
                            StretchMode.fadeTitle,
                            StretchMode.zoomBackground,
                            StretchMode.blurBackground,
                          ],
                          background: Image.asset(
                            'assets/image/background_image.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        leading: const Icon(Icons.note),
                      ),
                      SliverFixedExtentList(
                          itemExtent: 50.0,
                          delegate: SliverChildListDelegate([
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                            Text('1'),
                          ])),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          label: Text('text'),
                          style: ElevatedButton.styleFrom(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
