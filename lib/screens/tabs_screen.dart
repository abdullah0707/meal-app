import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoritesMeals, {super.key});

  final List<Meal> favoritesMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Widget>> _pages;

  @override
  void initState() {
    _pages = [
      {
        "page": const CategoriesScreen(),
        "title": const Text("Category"),
      },
      {
        "page": FavoritesScreen(widget.favoritesMeals),
        "title": const Text("Your Favorites"),
      },
    ];
    super.initState();
  }

  int _selectPageIndex = 0;
  void _selectPage(int value) => setState(() => _selectPageIndex = value);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: _pages[_selectPageIndex]['title']),
        body: _pages[_selectPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey[350],
          currentIndex: _selectPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ),
        drawer: const MainDrawer(),
      );
}
