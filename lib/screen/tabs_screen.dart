import 'categories_screen.dart';
import 'favorites_screen.dart';
import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'title': "Dish Discover", 'page': CategoriesScreen()},
    {'title': 'Favorites', 'page': FavoritesScreen()},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.brown,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        onTap: (value) => _selectPage(value),
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
