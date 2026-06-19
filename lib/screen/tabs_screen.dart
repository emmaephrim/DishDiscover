import 'package:dish_discover/screen/categories_screen.dart';
import 'package:dish_discover/screen/favorites_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.menu),
                ),
              );
            },
          ),
          title: Text('Dish Discover'),
        ),
        bottomSheet: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.category), text: "Categories"),
            Tab(icon: Icon(Icons.favorite), text: "Favorites"),
          ],
        ),
        body: TabBarView(children: [CategoriesScreen(), FavoritesScreen()]),
        drawer: Drawer(
          child: Column(children: [Text("list"), Text(" List 2ll")]),
        ),
      ),
    );
  }
}
