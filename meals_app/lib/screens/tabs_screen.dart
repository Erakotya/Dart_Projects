import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Meals"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.category), text: 'Categories'),
                Tab(
                  icon: Icon(Icons.star),
                  text: "Favorites",
                ),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            CategoriesScreen(), //the widget order matters! also, watch out for overlapping scaffolds()
            FavoriteScreen()
          ]) //what ever botton is pressed, "body" will represent it
          ),
    );
  }
}
