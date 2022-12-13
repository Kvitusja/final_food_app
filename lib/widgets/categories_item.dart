import 'package:flutter/material.dart';

import '../screens/categories_meal_screen.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryItem(
      {Key? key, required this.title, required this.color, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context,
            CategoryMealsScreen.routeName,
            arguments: {
              'id': id,
              'title': title,
            }
        );
      },
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.6), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}
