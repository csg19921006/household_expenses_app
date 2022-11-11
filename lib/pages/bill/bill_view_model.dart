import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_view_model.dart';
import 'package:household_expenses_app/pages/bill/bill_use_case.dart';

final billViewModelProvider = ChangeNotifierProvider<BillViewModel>((ref) {
  return BillViewModel(BillPageUseCase());
});

class BillViewModel extends BaseViewModel {
  final BillPageUseCase _useCase;

  BillViewModel(this._useCase) {
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
