import 'package:flutter/material.dart';
import './dummy_data.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DeliMeal')),
      body: GridView(
        padding: EdgeInsets.all(25),
        children:
            DUMMY_CATEGORIES //creates a list of categories from another file instead of manually inputing here.
                .map((catData) => CategoryItem(
                      catData.id,
                      catData.title,
                      catData.color,
                    ))
                .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}

//slivers are scrollable areas on the screen
// GrideDelegate - takes care of structuring layout in the grid
// crossaxisextent - if width provided, it will fit as many itens as possible


//names vs positional
// 1. in constructor use {} and arguments must be named the same as the argument call in another page. so, color: catData.color and on constructor this.color, and not this.anythingelse
// positional - position of argument matters but namign doesnt
