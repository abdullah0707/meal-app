import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;
  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.removeItem,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'UnKnown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'UnKnown';
    }
  }

  final textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  void selectMeal(BuildContext ctx) => Navigator.of(ctx)
      .pushNamed(MealDetailScreen.routeName, arguments: id)
      .then((resultMealId) => resultMealId != null ? removeItem(resultMealId) : null);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          color: Colors.white70,
          elevation: 4,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: Text(
                        title,
                        style:
                            const TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(width: 6),
                        Text('$duration min', style: textStyle),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work_outline),
                        const SizedBox(width: 6),
                        Text(complexityText, style: textStyle),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(width: 6),
                        Text(affordabilityText, style: textStyle),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
