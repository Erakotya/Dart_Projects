import 'package:flutter/material.dart';
import '../dummy_data.dart';

class mealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child:
                Text('Ingredients', style: Theme.of(context).textTheme.title),
          ),
          ListView()
          //dont use ListView with Columns because both try to take as much space as possible which will throw an error, instead wrap in container first
        ],
      ),
    );
  }
}
