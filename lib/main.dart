import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static TextTheme textStyleTheme = ThemeData.light().textTheme.copyWith(
        bodyLarge: const TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
        bodyMedium: const TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
        titleLarge: const TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritesMeals = [];

  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoritesMeals.indexWhere((meal) => meal.id == mealId);
    setState(() => existingIndex >= 0
        ? _favoritesMeals.removeAt(existingIndex)
        : _favoritesMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)));
    // existingIndex >= 0
    //     ? setState(() => _favoritesMeals.removeAt(existingIndex))
    //     : setState(() => _favoritesMeals
    //         .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)));

    // if (existingIndex >= 0) {
    //   setState(() => _favoritesMeals.removeAt(existingIndex));
    // } else {
    //   setState(() => _favoritesMeals
    //       .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)));
    // }
  }

  bool _isMealFavorites(String id) =>
      _favoritesMeals.any((meal) => meal.id == id);

  void _setFilters(Map<String, bool> filtersData) => setState(() {
        _filters = filtersData;
        _availableMeals = DUMMY_MEALS
            .where((meal) => _filters['gluten']! && !meal.isGlutenFree ||
                    _filters['lactose']! && !meal.isLactoseFree ||
                    _filters['vegan']! && !meal.isVegan ||
                    _filters['vegetarian']! && !meal.isVegetarian
                ? false
                : true)
            .toList();
      });

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: Colors.pink, secondary: Colors.amber),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: MyApp.textStyleTheme,
        ),
        darkTheme: ThemeData.dark().copyWith(
          textTheme: MyApp.textStyleTheme,
          colorScheme: const ColorScheme.light(
              primary: Colors.pink, secondary: Colors.amber),
        ),
        themeMode: ThemeMode.dark,
        initialRoute: '/',
        routes: {
          '/': (context) => TabsScreen(_favoritesMeals),
          CategoryMealsScreen.routeName: (context) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName: (context) =>
              MealDetailScreen(_toggleFavorites, _isMealFavorites),
          FiltersScreen.routeName: (context) =>
              FiltersScreen(_filters, _setFilters),
        },
      );
}
