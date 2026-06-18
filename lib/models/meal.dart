// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

enum Complexity { simple, hard, challenging }

enum Affordability { affordable, pricey, luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  Meal copyWith({
    String? id,
    List<String>? categories,
    String? title,
    String? imageUrl,
    List<String>? ingredients,
    List<String>? steps,
    int? duration,
    Complexity? complexity,
    Affordability? affordability,
    bool? isGlutenFree,
    bool? isLactoseFree,
    bool? isVegan,
    bool? isVegetarian,
  }) {
    return Meal(
      id: id ?? this.id,
      categories: categories ?? this.categories,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      duration: duration ?? this.duration,
      complexity: complexity ?? this.complexity,
      affordability: affordability ?? this.affordability,
      isGlutenFree: isGlutenFree ?? this.isGlutenFree,
      isLactoseFree: isLactoseFree ?? this.isLactoseFree,
      isVegan: isVegan ?? this.isVegan,
      isVegetarian: isVegetarian ?? this.isVegetarian,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categories': categories,
      'title': title,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'steps': steps,
      'duration': duration,
      'complexity': complexity,
      'affordability': affordability,
      'isGlutenFree': isGlutenFree,
      'isLactoseFree': isLactoseFree,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
    };
  }

  // factory Meals.fromMap(Map<String, dynamic> map) {
  //   return Meals(
  //     id: map['id'] as String,
  //     categories: List<String>.from((map['categories'] as List<String>),
  //     title: map['title'] as String,
  //     imageUrl: map['imageUrl'] as String,
  //     ingredients: List<String>.from((map['ingredients'] as List<String>),
  //     steps: List<String>.from((map['steps'] as List<String>),
  //     duration: map['duration'] as int,
  //     complexity: Complexity.fromMap(map['complexity'] as Map<String,dynamic>),
  //     affordability: Affordability.fromMap(map['affordability'] as Map<String,dynamic>),
  //     isGlutenFree: map['isGlutenFree'] as bool,
  //     isLactoseFree: map['isLactoseFree'] as bool,
  //     isVegan: map['isVegan'] as bool,
  //     isVegetarian: map['isVegetarian'] as bool,
  //   );
  // }

  String toJson() => json.encode(toMap());

  // factory Meals.fromJson(String source) => Meals.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Meals(id: $id, categories: $categories, title: $title, imageUrl: $imageUrl, ingredients: $ingredients, steps: $steps, duration: $duration, complexity: $complexity, affordability: $affordability, isGlutenFree: $isGlutenFree, isLactoseFree: $isLactoseFree, isVegan: $isVegan, isVegetarian: $isVegetarian)';
  }

  @override
  bool operator ==(covariant Meal other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.categories, categories) &&
        other.title == title &&
        other.imageUrl == imageUrl &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.steps, steps) &&
        other.duration == duration &&
        other.complexity == complexity &&
        other.affordability == affordability &&
        other.isGlutenFree == isGlutenFree &&
        other.isLactoseFree == isLactoseFree &&
        other.isVegan == isVegan &&
        other.isVegetarian == isVegetarian;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categories.hashCode ^
        title.hashCode ^
        imageUrl.hashCode ^
        ingredients.hashCode ^
        steps.hashCode ^
        duration.hashCode ^
        complexity.hashCode ^
        affordability.hashCode ^
        isGlutenFree.hashCode ^
        isLactoseFree.hashCode ^
        isVegan.hashCode ^
        isVegetarian.hashCode;
  }
}
