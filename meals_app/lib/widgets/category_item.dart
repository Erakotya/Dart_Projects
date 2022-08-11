import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(
    this.id,
    this.title,
    this.color,
  );

  void selectCategory(ctx) {
    Navigator.of(ctx).pushNamed(
        //pushed the name of the route, the same provided in main file under routes
        CategoryMealsScreen.routeName,
        //  or  '/category-meals',
        arguments: {
          'id': id,
          'title': title
        } //these arguments are passed to the new page
        // MaterialPageRoute(
        //   builder: (_) {
        //     return CategoryMealsScreen(id, title);
        //   },
        // ),
        ); //cupertinopageroute for ios
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding:
            const EdgeInsets.all(15), //watch deep dive to why there is a const
        child: Text(title, style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
