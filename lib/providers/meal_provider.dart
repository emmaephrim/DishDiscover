import 'filter_provider.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  // Whenever filterProvider changes, this entire block re-runs automatically!
  final activeFilters = ref.watch(filterProvider);

  //Filter the static DUMMY_MEALS list based on the active state
  return DUMMY_MEALS.where((meal) {
    if (activeFilters['isGlutenFree'] == true && !meal.isGlutenFree) {
      return false; // Filter says gluten-free only, but this meal isn't. Skip it.
    }
    if (activeFilters['isVegan'] == true && !meal.isVegan) {
      return false;
    }
    if (activeFilters['isVegetarian'] == true && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters['isLactoseFree'] == true && !meal.isLactoseFree) {
      return false;
    }
    return true; // Meal passed all active filters!
  }).toList();
});
