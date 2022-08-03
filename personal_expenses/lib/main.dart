import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //flutter packages get
import 'package:personal_expenses/widgets/transaction_list.dart';
import '../widgets/new_transaction.dart';
import '../widgets/user_transaction.dart';
import '../models/transaction.dart';
import '../widgets/chart.dart';

//ctrl + . to wrap
//ctrl + space for options

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber[800],
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(button: TextStyle(color: Colors.white)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //ctrl+shuft+r to convert stateless to state

  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: "t1",
    //   title: "New Shoes",
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t2",
    //   title: "Weekly Groceries",
    //   amount: 13.69,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTX = Transaction(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString());

    setState(() {
      //although _usertransactions is final, we can alter it, because it is a pointer.
      // we cant do _altertransaction = ... because that will change the ADDRESS, but otherwise we can alter the object itself
      _userTransactions.add(newTX);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return new_transaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
        title: Text("Personal Expenses"),
      ),
      body: SingleChildScrollView(
        //helps with the keyboard dimensions error //SingleChildScrollView
        child: Column(
          // column has the width of its widest child
          //mainAxisAlignment: MainAxisAlignment.start, its default so commet out
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Chart(_recentTransactions),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //backgroundColor: Colors.tealAccent,
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
