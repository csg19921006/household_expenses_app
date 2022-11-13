import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:household_expenses_app/model/person.dart';
import 'package:path_provider/path_provider.dart';

class HiveUseCase extends ChangeNotifier {
  static HiveUseCase? _instance;
  factory HiveUseCase() => _instance ??= HiveUseCase._internal();
  HiveUseCase._internal();
  static const _keyCategoryListKey = 'keyCategoryListKey';
  late final Box _box;
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapter(CategoryModelAdapter());
    _box = await Hive.openBox<CategoryModel>('box');
  }

  List<CategoryModel> readCategoryList() {
    try {
      final result = List<CategoryModel>.from(_box.values);
      return result;
    } catch (_) {
      return [];
    }
  }

  Future<void> addCategory(CategoryModel model) async {
    final list = List<CategoryModel>.from(_box.values);
    if (!list.map((e) => e.name).contains(model.name)) {
      _box.add(model);
    }
  }
}
