import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(this.toggleFavorites, this.isFavorites, {super.key});

  final Function toggleFavorites;
  final Function isFavorites;

  static const routeName = 'meal_detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((itemMeal) => itemMeal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  color: Colors.teal,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: Theme.of(ctx).textTheme.titleLarge,
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: Text(
                            '# ${index + 1}',
                            style: Theme.of(ctx).textTheme.titleLarge,
                          )),
                      title: Text(
                        selectedMeal.steps[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'RobotoCondensed',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorites(mealId),
        child: Icon(isFavorites(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }

  Container buildContainer(Widget child) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 300,
        height: 150,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: child,
      );

  Container buildSectionTitle(BuildContext ctx, String textTitle) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          textTitle,
          style: Theme.of(ctx).textTheme.titleLarge,
        ),
      );
}
