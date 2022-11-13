import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_page.dart';
import 'package:household_expenses_app/model/person.dart';
import 'package:household_expenses_app/pages/category/category_view_model.dart';
import 'package:household_expenses_app/widgets/common_button_widget.dart';
import 'package:household_expenses_app/widgets/common_divider.dart';

class CategoryPage extends StatelessWidget with BasePage {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('種類'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final pageState = ref.watch(categoryViewModelProvider).pageState;
          final categoryList =
              ref.read(categoryViewModelProvider).readCategoryList();
          return initBody(
            pageState: pageState,
            normalBody: Column(
              children: [
                Expanded(
                  child: ListView(
                    children:
                        categoryList.map((e) => _buildItemWidget(e)).toList(),
                  ),
                ),
                CommonButtonWidget(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Center(child: Text('添加分类')),
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(hintText: ''),
                                ),
                              ),
                              CommonButtonWidget(),
                              CommonButtonWidget(),
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildItemWidget(CategoryModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                Text(model.name),
              ],
            ),
          ),
          const CommonDivider(),
        ],
      ),
    );
  }
}
