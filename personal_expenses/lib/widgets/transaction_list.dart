import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart'; //flutter packages get

class TransactionList extends StatelessWidget {
  final List<Transaction> Transactions;

  TransactionList(this.Transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      // container was added so the the scrolling option was for the list. cant be done in main
      // for trasactions because u cant define height in SingleChildScrollView but can in container using height: # (lecture: making list scrollable)
      height:
          250, //dont remove this, flutter needs this a dimension constraints for scrolling
      child: Transactions.isEmpty
          ? Column(children: <Widget>[
              Text(
                'No Transactions Added Yet!',
              ),
              SizedBox(
                  height: 10), //used to provide seperation between elements
              Container(
                  height: 200,
                  child: Image.asset('images/zzz.png', fit: BoxFit.cover))
            ])
          : ListView.builder(
              //a column with SingleChildScrollView. if not the height: then listview would look at its then other parent which is column( in main). column takes all the height it can get (infinite) -> results in error
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child: Text('\$${Transactions[index].amount}')),
                          )),
                      title: Text(Transactions[index].title),
                      subtitle: Text(
                          DateFormat.yMMMd().format(Transactions[index].date))),
                );
                // Card(
                //     child: Row(
                //       children: <Widget>[
                //         Container(
                //             padding: EdgeInsets.all(10),
                //             margin:
                //                 EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //             decoration: BoxDecoration(
                //                 border: Border.all(
                //                 color : Theme.of(context).primaryColor, //context (an objesct) holds metadata on the widget, passed through the build method automatically BuildContext context. carries theme data
                //               //color: Colors.purple,
                //               width: 2,
                //             )),
                //             child: Text(
                //               '\$${Transactions[index].amount.toStringAsFixed(2)}' , //'\$' + Transactions[index].amount.toString(),
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 20,
                //                   color: Theme.of(context).primaryColor,

                //                   //color: Colors.purple),
                //               )
                //             )),
                //         Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: <Widget>[
                //               Text(Transactions[index].title,
                //                   style: TextStyle(
                //                       fontWeight: FontWeight.bold, fontSize: 16)),
                //               Text(DateFormat.yMMMd().format(Transactions[index].date), //tx.date
                //                   style: TextStyle(
                //                     color: Colors.grey,
                //                   ))
                //             ]),
                //       ],
                //     ),
                //   );
              }, //required when using listview.builder
              itemCount: Transactions.length,
              //children: Transactions.map((tx) {
              // use list view when the list lenght is short. builder shows up on UI only when we look at, otherwise doesnt render it. more memory friendly for long lists
              //}).toList(),
            ),
    );
  }
}
