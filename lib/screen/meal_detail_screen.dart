import 'package:dish_discover/providers/favorite_provider.dart';
import 'package:dish_discover/providers/meal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailScreen extends ConsumerWidget {
  static const routeName = '/meal-detail-screen';

  const MealDetailScreen({super.key});

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(5),
      width: double.infinity,
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dummyMeals = ref.watch(filteredMealsProvider);
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final meal = dummyMeals.firstWhere((item) => item.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.broken_image,
                      size: 48,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              context,
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).canvasColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(meal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              context,
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text("# ${index + 1}")),
                      title: Text(meal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        shape: const CircleBorder(),
        onPressed: () {
          ref.watch(favoriteProvider.notifier).toggleFavorite(meal);
        },
        child: ref.watch(favoriteProvider).contains(meal)
            ? Icon(Icons.star, color: Colors.black)
            : Icon(Icons.star_outline, color: Colors.black),
      ),
    );
  }
}
