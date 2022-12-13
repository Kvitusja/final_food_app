import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buildListTile({required String title, required IconData icon, required VoidCallback onTapAction}) {
    return ListTile(
      tileColor: const Color.fromRGBO(255, 192, 203, 1),
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapAction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            color: const Color.fromRGBO(255, 192, 203, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Center(
                  child: Text(
                    'Cooking Up!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Find the best recipes for you and your family',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            title: 'Meals',
            icon: Icons.restaurant,
            onTapAction: () => Navigator.of(context).pushNamed('/'),
          ),
          const ColoredBox(
            color: Colors.black54,
            child: SizedBox(
              height: 20,
            ),
          ),
          buildListTile(
            title: 'Filters',
            icon: Icons.settings,
               onTapAction: () => Navigator.of(context).pushNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
