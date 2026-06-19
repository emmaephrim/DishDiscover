// import 'package:flutter_riverpod/legacy.dart';

// final filterProvider = StateNotifierProvider<FilterNotifier, Map<String, bool>>(
//   (ref) {
//     return FilterNotifier();
//   },
// );

// class FilterNotifier extends StateNotifier<Map<String, bool>> {
//   FilterNotifier()
//     : super({
//         'isGlutenFree': false,
//         'isVegan': true,
//         'isVegetarian': true,
//         'isLactoseFree': true,
//       });

//   void toggleFilter(String filterKey, bool status) {
//     state = {...state, filterKey: status};
//   }
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterProvider = NotifierProvider<FilterNotifier, Map<String, bool>>(() {
  return FilterNotifier();
});

class FilterNotifier extends Notifier<Map<String, bool>> {
  @override
  Map<String, bool> build() {
    return {
      'isGlutenFree': false,
      'isVegan': false,
      'isVegetarian': false,
      'isLactoseFree': false,
    };
  }

  void toggleFilter(String filterKey, bool status) {
    state = {...state, filterKey: status};
  }
}
