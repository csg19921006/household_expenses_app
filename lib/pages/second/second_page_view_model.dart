import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_view_model.dart';
import 'package:household_expenses_app/pages/second/second_page_use_case.dart';

final secondPageViewModelProvider =
    ChangeNotifierProvider.autoDispose<SecondPageViewModel>((ref) {
  return SecondPageViewModel(SecondPageUseCase());
});

class SecondPageViewModel extends BaseViewModel {
  final SecondPageUseCase _useCase;

  SecondPageViewModel(this._useCase) {
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
}
