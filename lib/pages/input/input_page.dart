import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:household_expenses_app/base/base_page.dart';
import 'package:household_expenses_app/common/common_const.dart';
import 'package:household_expenses_app/model/person.dart';
import 'package:household_expenses_app/pages/input/input_view_model.dart';

class InputPage extends StatelessWidget with BasePage {
  const InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('記入'),
        leading: GestureDetector(
          child: const Icon(Icons.close),
          onTap: () {
            context.pop();
          },
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final pageState = ref.watch(inputViewModelProvider).pageState;
          final categoryList =
              ref.read(inputViewModelProvider).readCategoryList();
          return initBody(
            pageState: pageState,
            normalBody: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 20.0,
                        children: categoryList
                            .map((e) =>
                                _buildCategoryItemWidget(context, ref, e))
                            .toList(),
                      ),
                    ),
                  )),
                  const Divider(
                    thickness: 1.0,
                    height: 1.0,
                    color: Colors.grey,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 273.0,
                            color: Colors.grey,
                            child: Wrap(
                              spacing: 1.0,
                              runSpacing: 1.0,
                              children: [
                                _buildItemWidget(context, ref, title: '確認'),
                                _buildItemWidget(context, ref, title: '設定'),
                                _buildItemWidget(context, ref, title: ''),
                                _buildItemWidget(context, ref, title: '+'),
                                _buildItemWidget(context, ref, title: '-'),
                                _buildItemWidget(context, ref, title: 'JPY'),
                                _buildItemWidget(context, ref, title: '7'),
                                _buildItemWidget(context, ref, title: '8'),
                                _buildItemWidget(context, ref, title: '9'),
                                _buildItemWidget(context, ref, title: '4'),
                                _buildItemWidget(context, ref, title: '5'),
                                _buildItemWidget(context, ref, title: '6'),
                                _buildItemWidget(context, ref, title: '1'),
                                _buildItemWidget(context, ref, title: '2'),
                                _buildItemWidget(context, ref, title: '3'),
                                _buildItemWidget(context, ref, title: '.'),
                                _buildItemWidget(context, ref, title: '0'),
                                _buildItemWidget(context, ref, title: '<'),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1.0,
                            height: 1.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 60.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('0.00'),
                          ],
                        ),
                      )),
                    ],
                  ),
                  const Divider(
                    thickness: 1.0,
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildItemWidget(BuildContext context, WidgetRef ref,
      {required String title, double width = 90.0}) {
    return GestureDetector(
      onTap: () {
        if (title == '設定') {
          context.pushNamed(AppPageName.category);
        }
      },
      child: Container(
        width: width,
        height: width * 2 / 3,
        color: Colors.white,
        child: Center(child: Text(title)),
      ),
    );
  }

  Widget _buildCategoryItemWidget(
      BuildContext context, WidgetRef ref, CategoryModel model) {
    final width = (MediaQuery.of(context).size.width - 20.0 * 6) / 5;
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: width * 0.5,
        backgroundColor: Theme.of(context).primaryColor,
        child: Text(
          model.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
