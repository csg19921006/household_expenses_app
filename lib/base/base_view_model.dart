import 'package:flutter/cupertino.dart';

enum PageState {
  loading,
  normal,
  noneData,
  error,
}

class BaseViewModel extends ChangeNotifier {
  bool _isDisposed = false;
  PageState _pageState = PageState.normal;
  PageState get pageState => _pageState;
  set pageState(value) {
    _pageState = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }
}
