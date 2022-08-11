import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          '/': (ctx) => CategoriesScreen(),

          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(), //or you can use the link style - "'/category_meals'"
          mealDetailScreen.routeName: (ctx) => mealDetailScreen(),
        });
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
