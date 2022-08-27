import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(
        context); //this indicated that the class ProductsGrid is listening to changes coming from Products()
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    //final products = productsData.items; // after caling on Products(), we create a variable that hold oll the items in it, which are of type Product()
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length, //required line
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        //create: (c) => products[i], //create=builder, product[i] = ith Product() since product is a list of items which are of type Product()
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


//when ever you instantiate a class, like when we do in main, use create method. When reusing an existing object, like in products_grid, it is recommended to use value approach.
//changenotifierprovider cleans up data so it doesnt take up memory

//another substitution for Provider.of() is Consumer. It works the same way, but can have a benefit under certain circumstances -> it can make a specific section of a class to listen to changes
// provider.of() makes the entire class listen to changes which might be a little less efficient. watch Using "Consumer" instead of "Provider.of" for examples

