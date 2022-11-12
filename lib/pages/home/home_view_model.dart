import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_view_model.dart';
import 'package:household_expenses_app/pages/home/home_use_case.dart';

final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel(HomePageUseCase());
});

class HomeViewModel extends BaseViewModel {
  final HomePageUseCase _useCase;

  HomeViewModel(this._useCase) {
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

  List<String> readCategoryList() {
    return hiveUseCase.readCategoryList();
  }

  void addCategory() async {
    await hiveUseCase.addCategory('食事');
    notifyListeners();
  }
}
