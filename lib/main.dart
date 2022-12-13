import 'package:flutter/material.dart';

import 'screens/categories_meal_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      //home: const CategoriesScreen(),
      routes: {
        '/': (context) => const TabsScreen(),
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen(),
        FiltersScreen.routeName: (context) => const FiltersScreen(),
      },
    );
  }
}
