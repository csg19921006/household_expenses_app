import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_view_model.dart';
import 'package:household_expenses_app/pages/report/report_use_case.dart';

final reportViewModelProvider = ChangeNotifierProvider<ReportViewModel>((ref) {
  return ReportViewModel(ReportUseCase());
});

class ReportViewModel extends BaseViewModel {
  final ReportUseCase _useCase;

  ReportViewModel(this._useCase) {
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
