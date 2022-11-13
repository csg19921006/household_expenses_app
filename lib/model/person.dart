import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  String imagePath;

  @HiveField(2)
  String content;
  CategoryModel(this.name, this.imagePath, this.content);
}
