import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      body: Center(child: Text('Filters!')),
      drawer: MainDrawer(),//commenting this out wont allow user to go back (useful when doing logins)
    );
  }
}
