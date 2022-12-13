import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../screens/meal_details_screen.dart';


class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key? key,
        required this.title,
        required this.imageUrl,
        required this.duration,
        required this.complexity,
        required this.affordability, required this.id})
      : super(key: key);


  void selectMeal(BuildContext context) {
    Navigator.pushNamed(
        context,
        MealDetailsScreen.routeName);
  }

  String get complexityText {
    switch(complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch(affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void mealItems (BuildContext context) {
    Navigator.pushNamed(
      context,
      MealDetailsScreen.routeName, arguments: id,);
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mealItems(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.black54,),
                    width: 220,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 7,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on_outlined),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
