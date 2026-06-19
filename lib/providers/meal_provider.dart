import 'package:dish_discover/data/dummy_data.dart';
import 'package:dish_discover/models/meal.dart';
import 'package:flutter_riverpod/legacy.dart';

final mealProvider =
    StateNotifierProvider.autoDispose<MealNotifier, List<Meal>>((ref) {
      return MealNotifier();
    });

class MealNotifier extends StateNotifier<List<Meal>> {
  MealNotifier() : super(DUMMY_MEALS);

  void removeMeal(String id) {
    state = state.where((meal) => meal.id != id).toList();
  }

  void filterVegan(bool status) {
    if (status == true) {
      state = state.where((item) => item.isVegan == true).toList();
    } else {
      state = state.where((item) => item.isVegan == false).toList();
    }
  }

  void filterVegetarian(bool status) {
    state = state.where((item) => item.isVegan == true).toList();
  }
}

// class TodoListNotifier extends StateNotifier<List<Todo>> {
//   TodoListNotifier() : super([]);

//   void addTodo(String content) {
//     state = [
//       ...state,
//       Todo(
//         todoId: state.isEmpty ? 0 : state[state.length - 1].todoId + 1,
//         content: content,
//         completed: false,
//       ),
//     ];
//   }

//   void completeTodo(int id) {
//     state = state
//         .map(
//           (todo) => todo.todoId == id ? todo.copyWith(completed: true) : todo,
//         )
//         .toList();
//   }

//   void deleteTodo(Todo todo) {
//     state = state.where((t) => t.todoId != todo.todoId).toList();
//   }
// }
