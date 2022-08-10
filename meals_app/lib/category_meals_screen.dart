import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // final String categoryId;
  // final String CategoryTitle;

  // CategoryMealsScreen(this.categoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}


//the route path is: categoryItem -> main -> categorymealsscreen
//category item searches from dictionary provided in main for the desired path. the indicaeted args get later passed to categoryMealsScreen through main. the actual arguments are known thorugh 
//context. CMS recieves the arguments in a form of map and can use the data to create page. this method is favored when having many pages