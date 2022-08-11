import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // final String categoryId;
  // final String CategoryTitle;

  // CategoryMealsScreen(this.categoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    print(routeArgs);
    final categoryTitle = routeArgs['title']; //used for page title
    final categoryId = routeArgs['id']; //used for search
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return mealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              id: categoryMeals[index].id);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}


//the route path is: categoryItem -> main -> categorymealsscreen
//category item searches from dictionary provided in main for the desired path. the indicaeted args get later passed to categoryMealsScreen through main. the actual arguments are known thorugh 
//context. CMS recieves the arguments in a form of map and can use the data to create page. this method is favored when having many pages