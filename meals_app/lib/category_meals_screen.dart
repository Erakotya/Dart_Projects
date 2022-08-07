import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String CategoryTitle;

  CategoryMealsScreen(this.categoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(CategoryTitle)),
        body: Center(
          child: Text(
            'The Recipes For The Category!',
          ),
        ));
  }
}
