import 'package:hive_flutter/hive_flutter.dart';
part 'category_model.g.dart';
@HiveType(typeId: 0)
enum CategoryType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}
@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final bool isDelete;
  @HiveField(3)
  final CategoryType categoryType;
  CategoryModel({
    required this.id,
    required this.name,
    required this.categoryType,
    this.isDelete= false
  });

  @override
  String toString() {
    return '{id: $id, name: $name, is_delete: $isDelete, type: $categoryType}';
  }
}