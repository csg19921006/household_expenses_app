import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_view_model.dart';
import 'package:household_expenses_app/model/person.dart';
import 'package:household_expenses_app/pages/input/input_use_case.dart';

final inputViewModelProvider =
    ChangeNotifierProvider.autoDispose<InputViewModel>((ref) {
  return InputViewModel(InputPageUseCase());
});

class InputViewModel extends BaseViewModel {
  final InputPageUseCase _useCase;

  InputViewModel(this._useCase) {
    _loadData();
  }

  void _loadData() async {
    pageState = PageState.loading;
    try {
      await _useCase.loadData();
      pageState = PageState.normal;
    } catch (_) {
      pageState = PageState.error;
    }
  }

  void reFreshData() {
    _loadData();
  }

  List<CategoryModel> readCategoryList() {
    final list = List<CategoryModel>.from(hiveUseCase.readCategoryList());
    return list;
  }

  void addCategory() async {
    await hiveUseCase.addCategory(CategoryModel('食事', 'image', 'content'));
    notifyListeners();
  }
}
