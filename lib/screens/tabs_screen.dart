import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Widget>> _pages = [
    {
      "page": const CategoriesScreen(),
      "title": const Text("Category"),
    },
    {
      "page": const FavoritesScreen(),
      "title": const Text("Your Favorites"),
    },
  ];

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
