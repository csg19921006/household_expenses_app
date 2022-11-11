import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/base/base_view_model.dart';
import 'package:household_expenses_app/pages/profile/profile_use_case.dart';

final profileViewModelProvider =
    ChangeNotifierProvider<ProfileViewModel>((ref) {
  return ProfileViewModel(ProfileUseCase());
});

class ProfileViewModel extends BaseViewModel {
  final ProfileUseCase _useCase;

  ProfileViewModel(this._useCase) {
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
