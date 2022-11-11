class HomePageUseCase {
  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
