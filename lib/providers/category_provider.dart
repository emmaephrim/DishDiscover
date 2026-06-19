import 'package:dish_discover/data/dummy_data.dart';
import 'package:dish_discover/models/category.dart';
import 'package:flutter_riverpod/legacy.dart';

final categoryProvider =
    StateNotifierProvider.autoDispose<CategoryNotifier, List<Category>>((ref) {
      return CategoryNotifier();
    });

class CategoryNotifier extends StateNotifier<List<Category>> {
  CategoryNotifier() : super(DUMMY_CATEGORIES);
}
