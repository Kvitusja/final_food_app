import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favourites;
  const FavouritesScreen({Key? key, required this.favourites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(favourites.isEmpty) {
      return const Center(child: Text('You have no favourite meals yet'));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favourites[index].id,
            title: favourites[index].title,
            imageUrl: favourites[index].imageUrl,
            duration: favourites[index].duration,
            complexity: favourites[index].complexity,
            affordability: favourites[index].affordability,
          );
        },
        itemCount: favourites.length,
      );

    }
  }
}
