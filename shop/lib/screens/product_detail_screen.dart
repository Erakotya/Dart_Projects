import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title,this.price);

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments
        as String; //here we pass title from another page
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
      //listen: this allows to not listen in to changes coming from Products. Useful if you want to listen to Products once (recieve global information probably when starting page) and not listen to updates.
    ).findById(productId);
    // gives access to products (variable can change if Products() calls on rebuild through notifyListeners())
    return Scaffold(
        appBar: AppBar(title: Text(loadedProduct.title)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child:
                    Image.network(loadedProduct.imageUrl, fit: BoxFit.contain),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$${loadedProduct.price}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Text(
                    '${loadedProduct.description}',
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ))
            ],
          ),
        ));
  }
}
