import 'package:dish_discover/widgets/meal_item.dart';

import '../data/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "category-meals";
  //   final String categoryId;
  //   final String categoryTitle;

  //   const CategoryMealsScreen({
  //     super.key,
  //     required this.categoryId,
  //     required this.categoryTitle,
  //   });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final categoryId = routeArgs['id'] as String;
    final categoryTitle = routeArgs['title'] as String;

    final categoryMeals = DUMMY_MEALS
        .where((item) => item.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) => MealItem(
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
          complexity: categoryMeals[index].complexity,
          affordability: categoryMeals[index].affordability,
        ),
      ),
    );
  }
}
