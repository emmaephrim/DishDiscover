import 'package:dish_discover/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider = NotifierProvider<FavoriteNotifier, List<Meal>>(
  FavoriteNotifier.new,
);

class FavoriteNotifier extends Notifier<List<Meal>> {
  @override
  List<Meal> build() {
    return [];
  }

  void addM(Meal meal) {
    state = [...state, meal];
  }

  void removeFavorite(Meal meal) {
    state = state.where((item) => item != meal).toList();
  }

  void toggleFavorite(Meal meal) {
    final isFavorite = state.contains(meal);
    if (isFavorite) {
      state = state.where((item) => item != meal).toList();
    } else {
      state = [...state, meal];
    }
  }
}
