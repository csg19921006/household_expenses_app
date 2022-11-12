import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_page.dart';
import 'package:household_expenses_app/pages/home/home_view_model.dart';

class HomePage extends StatelessWidget with BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final pageState = ref.watch(homeViewModelProvider).pageState;
        return initBody(
          pageState: pageState,
          normalBody: _buildNormalBodyWidget(ref),
        );
      },
    );
  }

  Widget _buildNormalBodyWidget(WidgetRef ref) {
    return Column(
      children: [
        _buildListWidget(ref),
        _buildAddButtonWidget(),
      ],
    );
  }

  Widget _buildListWidget(WidgetRef ref) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          ref.read(homeViewModelProvider).reFreshData();
        },
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
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('日付'),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.ac_unit),
                                Text('種類'),
                                Text('\$2.0'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.ac_unit),
                                Text('種類'),
                                Text('\$2.0'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ])),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButtonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
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
    );
  }
}
