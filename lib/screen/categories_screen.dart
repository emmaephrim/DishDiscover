import '../models/category.dart';
import '../providers/category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Category> categories = ref.watch(categoryProvider);

    return GridView(
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: categories
          .map(
            (item) =>
                CategoryItem(color: item.color, title: item.title, id: item.id),
          )
          .toList(),
    );
  }
}
