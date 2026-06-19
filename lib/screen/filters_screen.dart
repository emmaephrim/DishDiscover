import 'package:dish_discover/providers/filter_provider.dart';
import 'package:dish_discover/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  static const routeName = 'filters-screen';

  FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  Widget buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    ValueChanged<bool> updateValue,
  ) {
    return SwitchListTile(
      activeTrackColor: Colors.amber,
      activeThumbColor: Colors.black,
      onChanged: updateValue,
      value: currentValue,
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeFilters = ref.watch(filterProvider);

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text("Filters")),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "Adjust your meal selection",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  "Gluten-free",
                  "Only include gluten-free meal",
                  activeFilters['isGlutenFree'] ?? false,
                  (newValue) => ref
                      .read(filterProvider.notifier)
                      .toggleFilter('isGlutenFree', newValue),
                ),
                buildSwitchListTile(
                  "Lactose-free",
                  "Only include lactose-free meal",
                  activeFilters['isLactoseFree'] ?? false,
                  (newValue) => ref
                      .read(filterProvider.notifier)
                      .toggleFilter('isLactoseFree', newValue),
                ),
                buildSwitchListTile(
                  "Vegan",
                  "Only include vegan meal",
                  activeFilters['isVegan'] ?? false,
                  (newValue) => ref
                      .read(filterProvider.notifier)
                      .toggleFilter('isVegan', newValue),
                ),
                buildSwitchListTile(
                  "Vegetarian",
                  "Only include vegetarian meal",
                  activeFilters['isVegetarian'] ?? false,
                  (newValue) => ref
                      .read(filterProvider.notifier)
                      .toggleFilter('isVegetarian', newValue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
