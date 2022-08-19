import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters.dart';
import './dummy_data.dart';
import './models/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          //if filter is set to show only gluten free && meal is gluten free, then dont show item
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold,
                ),
              )),
      initialRoute: '/',
      //home: CategoriesScreen(),

      routes: {
        '/': (ctx) => TabScreen(),

        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
            _availableMeals), //or you can use the link style - "'/category_meals'"

        mealDetailScreen.routeName: (ctx) => mealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        //navigates user to specified route in case the route the user wanted to go to doesnt exist by name
        //print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        //when everything above fails, it send back to original page (instead of crashing)
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //widget commonly used for screen/page widgets
      appBar: AppBar(
        title: Text("DeliMeals"),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
