import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveUseCase extends ChangeNotifier {
  static HiveUseCase? _instance;
  factory HiveUseCase() => _instance ??= HiveUseCase._internal();
  HiveUseCase._internal();
  static const _keyCategoryListKey = 'keyCategoryListKey';
  late final Box _box;
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    _box = await Hive.openBox('box');
    print(_box);
  }

  List<String> readCategoryList() {
    try {
      final result = List<String>.from(_box.values);
      return result;
    } catch (_) {
      return [];
    }
  }

  Future<void> addCategory(String category) async {
    _box.add(category);
  }
}
