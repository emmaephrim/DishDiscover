import 'package:dish_discover/screen/categories_screen.dart';
import 'package:dish_discover/screen/category_meals_screen.dart';
import 'package:dish_discover/screen/meal_detail_screen.dart';
import 'package:dish_discover/screen/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dish Discover',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 245, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "RobotoCondensed",
          ),
        ),
      ),
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: ((context) => CategoriesScreen())),
    );
  }
}
