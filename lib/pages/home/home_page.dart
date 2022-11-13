import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:household_expenses_app/base/base_page.dart';
import 'package:household_expenses_app/common/common_const.dart';
import 'package:household_expenses_app/pages/home/home_view_model.dart';
import 'package:household_expenses_app/widgets/common_button_widget.dart';

class HomePage extends StatelessWidget with BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final pageState = ref.watch(homeViewModelProvider).pageState;
        return initBody(
          pageState: pageState,
          normalBody: _buildNormalBodyWidget(context, ref),
        );
      },
    );
  }

  Widget _buildNormalBodyWidget(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _buildListWidget(ref),
        CommonButtonWidget(
          onPressed: () {
            context.pushNamed(AppPageName.input);
          },
        ),
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
                    Column(
                      children: ref
                          .read(homeViewModelProvider)
                          .readCategoryList()
                          .map((e) => HomeItemWidget(content: e.name))
                          .toList(),
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
}

class HomeItemWidget extends StatelessWidget {
  final String content;
  const HomeItemWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.ac_unit),
                Text(content),
                const Text('\$2.0'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
