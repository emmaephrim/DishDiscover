import 'package:dish_discover/data/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-screen';

  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((item) => item.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Center(child: Text(mealId)),
    );
  }
}
