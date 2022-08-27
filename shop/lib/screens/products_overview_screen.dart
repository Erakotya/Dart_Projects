import 'package:flutter/material.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';
import '../widgets/products_grid.dart';
import 'package:provider/provider.dart';

//enums are used to assign labels to integers. In the background flutter runs numbers, but we as developers, can have an easier time woring with it
enum FilterOptions {
  Favorites, //0
  All, //1
}

class ProductsOverViewScreen extends StatefulWidget {
  @override
  _ProductsOverViewScreenState createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    //final productsContainer = Provider.of<Products>(context); after commenting this out, we convert the widget from stateless to stateful
    return Scaffold(
      appBar: AppBar(title: Text('MyShop'), actions: <Widget>[
        PopupMenuButton(
          onSelected: (FilterOptions selectedValue) {
            //watch Local State Versus App-Wide State if needed
            setState(() {
              if (selectedValue == FilterOptions.Favorites) {
                _showOnlyFavorites = true;
                //productsContainer.showFavoritesOnly();
              } else {
                _showOnlyFavorites = false;

                //productsContainer.showAll();
              }
            });
          },
          icon: Icon(
            Icons.more_vert,
          ),
          itemBuilder: (_) => [
            PopupMenuItem(
                child: Text('Only Favorites'), value: FilterOptions.Favorites),
            PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
          ],
        )
      ]),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
