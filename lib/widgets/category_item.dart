import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.id, this.title, this.color, {super.key});

  final String id;
  final String title;
  final Color color;
  

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            title,
            // style: textStyleTheme,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      );
}
