import 'package:flutter/material.dart';

import '../DUMMY_DATA.dart';


class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal_details_screen';
  Widget buildSectionTitle(BuildContext context, String title) {
    return SizedBox(
      child: Text(
        title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 200,
      width: 350,
      child: child,
    );
  }

  const MealDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    //final selectIngredients = DUMMY_MEALS.firstWhere((meal) => meal.ingredients == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectMeal.title)),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SingleChildScrollView(
          child:
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                Scrollbar(
                  radius: const Radius.circular(6),
                  thickness: 8,
                  //thumbVisibility: true,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectMeal.steps[index]),
                      ),
                    ),
                    itemCount: selectMeal.steps.length,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                Scrollbar(
                  radius: const Radius.circular(6),
                  thickness: 8,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => const Divider(
                      color: Colors.black54,
                      thickness: 1.3,
                    ),
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        (selectMeal.steps[index]),
                      ),
                    ),
                    itemCount: selectMeal.steps.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
