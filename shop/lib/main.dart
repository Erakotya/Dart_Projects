import 'package:flutter/material.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'),
      home: ProductsOverViewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
      ),
      body: Center(child: Text('lolz')),
    );
  }
}
