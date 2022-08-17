import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'cooking up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(
                '/'); //replace existing (top) page with new page, other wise, by using push/pushnamed, over time the side menu pages will stack on top of each other.
            //this doesnt work the same with other pages, like categories, because we use the back button, which removes ages from stack
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
            //push replacement can be used for log in cases, where you dont want the user to go back. example: comment out drawer in flters -> cant go back to main once on page.
          }),
        ],
      ),
    );
  }
}
