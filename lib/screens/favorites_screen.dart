import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen(this.favoritesMeals, {super.key});

  final List<Meal> favoritesMeals;

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favorite meals yet!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
          id: favoritesMeals[index].id,
          title: favoritesMeals[index].title,
          imageUrl: favoritesMeals[index].imageUrl,
          duration: favoritesMeals[index].duration,
          complexity: favoritesMeals[index].complexity,
          affordability: favoritesMeals[index].affordability,
        ),
        itemCount: favoritesMeals.length,
      );
    }
  }
}
