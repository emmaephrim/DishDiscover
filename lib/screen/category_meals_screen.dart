import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  //   final String categoryId;
  //   final String categoryTitle;

  //   const CategoryMealsScreen({
  //     super.key,
  //     required this.categoryId,
  //     required this.categoryTitle,
  //   });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final categoryId = routeArgs['id'] as String;
    final categoryTitle = routeArgs['title'] as String;
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(child: Text("Res SCreen")),
    );
  }
}
