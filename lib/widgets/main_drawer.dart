import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).colorScheme.secondary,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildListTile(
              Icons.restaurant,
              'Meal',
              () => Navigator.of(context).pushReplacementNamed('/'),
              context,
            ),
            buildListTile(
              Icons.filter_alt,
              'Filters',
              () => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName),
              context,
            ),
          ],
        ),
      );

  ListTile buildListTile(icon, title, tapHandler, ctx) => ListTile(
        leading: Icon(
          icon,
          size: 26,
          color: Theme.of(ctx).colorScheme.primary,
        ),
        title: Text(
          title,
          style: Theme.of(ctx).textTheme.titleLarge,
        ),
        onTap: tapHandler,
      );
}
