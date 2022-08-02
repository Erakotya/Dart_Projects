import 'package:flutter/material.dart';
import '../widgets/user_transaction.dart';

class new_transaction extends StatefulWidget { //was refracted when text wont stay on textfield when making new transaction
                                                //when flutter reevaluates widgets, stateless widgets lose data, and stateful widgets's data is remained
  final Function addNewTransaction;



  new_transaction(this.addNewTransaction);

  @override
  _new_transactionState createState() => _new_transactionState();
}

class _new_transactionState extends State<new_transaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){

    final enteredTitle = titleController.text;
    final enteredAmount  = double.parse(amountController.text);


    if (enteredTitle.isEmpty || enteredAmount <= 0){

      return;
    }

    widget.addNewTransaction(
      enteredTitle,
      enteredAmount
      );

      Navigator.of(context).pop(); //close top most screen (transaction is added but screen doesnt close automatically)
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    onSubmitted: (_) => submitData(),
                    //onChanged: (val){
                    //titleInput = val;
                    //},

                  ),
                  TextField(decoration: InputDecoration(labelText: 'Amount'),
                  // onChanged: (val){
                  //     amountInput = val; // or (val) => amountInput = val;
                  //     } //replaced for controller
                  controller: amountController,
                  keyboardType:TextInputType.number, //different on ios, see tutorial Further Input and Output Styling and Configuration
                  onSubmitted: (_) => submitData(), // can also put some random named var in () instead of _ (says i dont care about user input), or pass 'String val' in function parameter
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                    onPressed:
                      submitData
                    
                  )
                ],
              ),
            ),
          );
  }
}