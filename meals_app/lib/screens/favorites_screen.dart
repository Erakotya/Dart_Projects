import 'package:flutter/material.dart';
import '../models/model.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(child: Text('the favortie'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return mealItem(
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            id: favoriteMeals[index].id,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
