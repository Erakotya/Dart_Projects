import 'package:flutter/material.dart';
import '../widgets/user_transaction.dart';
import 'package:intl/intl.dart'; //flutter packages get, used for time formatting

class new_transaction extends StatefulWidget {
  //was refracted when text wont stay on textfield when making new transaction
  //when flutter reevaluates widgets, stateless widgets lose data, and stateful widgets's data is remained
  final Function addNewTransaction;

  new_transaction(this.addNewTransaction);

  @override
  _new_transactionState createState() => _new_transactionState();
}

class _new_transactionState extends State<new_transaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;
  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context)
        .pop(); //close top most screen (transaction is added but screen doesnt close automatically)
  }

  void _presentDatePicker() {
    showDatePicker(
      context: (context),
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              //onChanged: (val){
              //titleInput = val;
              //},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val){
              //     amountInput = val; // or (val) => amountInput = val;
              //     } //replaced for controller
              controller: _amountController,
              keyboardType: TextInputType
                  .number, //different on ios, see tutorial Further Input and Output Styling and Configuration
              onSubmitted: (_) =>
                  _submitData(), // can also put some random named var in () instead of _ (says i dont care about user input), or pass 'String val' in function parameter
            ),
            Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen'
                        : DateFormat.yMd().format(_selectedDate)),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData)
          ],
        ),
      ),
    );
  }
}
