import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
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
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          fontFamily: 'RobotoCondensed',
          colorScheme: const ColorScheme.light(
              primary: Colors.pink, secondary: Colors.amber),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: textStyleTheme,
        ),
        darkTheme: ThemeData.dark().copyWith(
          textTheme: textStyleTheme,
          colorScheme: const ColorScheme.light(
              primary: Colors.pink, secondary: Colors.amber),
        ),
        themeMode: ThemeMode.dark,
        home: const CategoriesScreen(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Meal App'),
          centerTitle: true,
        ),
        body: const CategoriesScreen(),
      );
}
