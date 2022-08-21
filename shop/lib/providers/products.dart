import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../models/products.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    _items.add(value);
    notifyListeners();
  }
}
