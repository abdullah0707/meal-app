import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Your Filterrs'),
        ),
        body: const Center(
          child: Text('Filters!'),
        ),
        drawer: const MainDrawer(),
      );
}
