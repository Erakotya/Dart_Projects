import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/model.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }
  // void initState(){
  //   final routeArgs =
  //       ModalRoute.of(context).settings.arguments as Map<String, String>;
  //   print(routeArgs);
  //   final categoryTitle = routeArgs['title']; //used for page title
  //   final categoryId = routeArgs['id']; //used for search
  //   final displayedMeals = DUMMY_MEALS.where((meal) {
  //     return meal.categories.contains(categoryId);
  //   }).toList();

  // } cant use init for this code because of ModalRoute. Both arent compatible. context relies on the widget, but init runs before the widget is built. if not modal
  // it would have worked. the solution is to use didChangeDependencies

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  void didChangeDependencies() {
    if (!_loadedInitData) {
      //didchangedependencies run again if there been changes (state changes, aka setstate is called). solution: create a mark that signals that we are done initializing
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      print(routeArgs);
      categoryTitle = routeArgs['title']; //used for page title
      final categoryId = routeArgs['id']; //used for search
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    //this will run before build, but right after the widget is created

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return mealItem(
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            id: displayedMeals[index].id,
            //removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}


//the route path is: categoryItem -> main -> categorymealsscreen
//category item searches from dictionary provided in main for the desired path. the indicaeted args get later passed to categoryMealsScreen through main. the actual arguments are known thorugh 
//context. CMS recieves the arguments in a form of map and can use the data to create page. this method is favored when having many pages