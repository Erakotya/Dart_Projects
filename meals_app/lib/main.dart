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
//NOTE, IMPOTANT FOR DEVICE: main holds all global variables and some functions so you can pass values around the different pages.
  //global variables
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          //if filter is set to show only gluten free && meal is not gluten free, then dont show item
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

  void _toggleFavorite(String mealId) {
    //check if element exists in favorite list
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    //yes: remove item from favorite list
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    //no: find the first item (essentially, find the item) with the corresponding it, and add to list. want unfiltered options (dummy_data) unlike before (we usr _favortieMeals in prev. if())
    else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  } //if item exists in favoritre list, remove it, bc it is a toggle method

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
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
        '/': (ctx) => TabScreen(_favoriteMeals),

        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
            _availableMeals), //or you can use the link style - "'/category_meals'"

        mealDetailScreen.routeName: (ctx) =>
            mealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters,
            _setFilters), //IMPORTANT, we send pointers, so the function used in main and can therefor access variables in main from another page
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
