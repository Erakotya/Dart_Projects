import 'package:flutter/material.dart';
import '../models/model.dart'; //@required s possible bc it is in model.dart
import '../screens/meal_detail_screen.dart';

class mealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  mealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.id,
      @required this.removeItem});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challanging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
    //can use multiple if statements but there is an alternative
    // if (complexity == Complexity.Simple){
    //   return "Simple";
    // }
  }

  String get affordabilityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Affordable';
        break;
      case Complexity.Challenging:
        return 'Pricey';
        break;
      case Complexity.Hard:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      //pushnamed is of type future. This means function is done once we pop te page we initially navigated to. Once done we call on then()
      mealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    //reoves corners to fit into card, otherwise there are sharp corners overlapping the rounded edges
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover, //crop+resize image to fit container
                    ),
                  ),
                  Positioned(
                    //works only in stack, determines coordinate positions of something
                    bottom: 20,
                    right: 10,
                    child: Container(
                      //to deal with text overflow, need to wrap in a container to define boundaries
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: 300,
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.work,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
