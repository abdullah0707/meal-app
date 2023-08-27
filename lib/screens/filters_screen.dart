import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegetarian']!;
    _vegetarian = widget.currentFilters['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Your Filterrs'),
          actions: [
            IconButton(
                onPressed: () {
                  final Map<String, bool> selectFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                  };
                  widget.saveFilters(selectFilters);
                  Navigator.of(context).pushNamed('/');
                },
                icon: const Icon(Icons.save_rounded))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'adjust your meal selection!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                      context,
                      'Gluten-free',
                      'Only include gluten-free meals.',
                      _glutenFree,
                      (newValue) => setState(() => _glutenFree = newValue)),
                  buildSwitchListTile(
                      context,
                      'Lactose-free',
                      'Only include lactose-free meals.',
                      _lactoseFree,
                      (newValue) => setState(() => _lactoseFree = newValue)),
                  buildSwitchListTile(
                      context,
                      'Vegan',
                      'Only include vegan meals.',
                      _vegan,
                      (newValue) => setState(() => _vegan = newValue)),
                  buildSwitchListTile(
                      context,
                      'Vegetarian',
                      'Only include vegetarian meals.',
                      _vegetarian,
                      (newValue) => setState(() => _vegetarian = newValue)),
                ],
              ),
            ),
          ],
        ),
        drawer: const MainDrawer(),
      );

  SwitchListTile buildSwitchListTile(
          ctx, title, description, currentValue, updateValue) =>
      SwitchListTile(
        value: currentValue,
        onChanged: updateValue,
        title: Text(
          title,
          style: Theme.of(ctx).textTheme.titleLarge,
        ),
        subtitle: Text(
          description,
          style: Theme.of(ctx).textTheme.titleLarge,
        ),
      );
}
