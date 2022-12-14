import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/model.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>>
      _pages; //we initializa the list here, but equate it to an actual list in the initstate()
  // final List<Map<String, Object>> _pages = [
  //   {'page': CategoriesScreen(), 'title': 'Categories'},
  //   {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Your Favorite'}
  // ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Favorite'
      } //widget cant be used here when initializing properties, therefor we put it in initstate() instead of a stand alone variable
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorites"),
          ),
        ],
      ),
    );

    // return DefaultTabController(
    //   length: 2,
    //   initialIndex:
    //       1, //configures which tab is opened initially, 0-left, 1-right
    //   child: Scaffold(
    //       appBar: AppBar(
    //         title: Text("Meals"),
    //         bottom: TabBar(
    //           tabs: <Widget>[
    //             Tab(icon: Icon(Icons.category), text: 'Categories'),
    //             Tab(
    //               icon: Icon(Icons.star),
    //               text: "Favorites",
    //             ),
    //           ],
    //         ),
    //       ),
    //       body: TabBarView(children: <Widget>[
    //         CategoriesScreen(), //the widget order matters! also, watch out for overlapping scaffolds()
    //         FavoriteScreen()
    //       ]) //what ever botton is pressed, "body" will represent it
    //       ),
    // );
  }
}
