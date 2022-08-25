import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (c) => products[i], //create=builder
        //defines how to build each object
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    ); //defines how objects will be layed out);
  }
}

//this line -> final productsData = Provider.of<Products>(context); listens to the changes in the class. You indicate the class you want to listen to, and it traels up the widget tree to find
//create: (ctx) =>Products(), which is provided in the main page