// import 'package:flutter/material.dart';
// import '../widgets/transaction_list.dart';
// import '../widgets/new_transaction.dart';
// import '../models/transaction.dart';

// class UserTransactions extends StatefulWidget {
//   @override
//   State<UserTransactions> createState() => _UserTransactionsState();
// }

// class _UserTransactionsState extends State<UserTransactions> {
//   //stateful widget composed of a stateful and stateless widgets

//   final List<Transaction> _userTransactions = [
//     Transaction(
//       id: "t1",
//       title: "New Shoes",
//       amount: 69.99,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t2",
//       title: "Weekly Groceries",
//       amount: 13.69,
//       date: DateTime.now(),
//     ),
//   ];

//   void _addNewTransaction(String txTitle, double txAmount) {
//     final newTX = Transaction(
//         title: txTitle,
//         amount: txAmount,
//         date: DateTime.now(),
//         id: DateTime.now().toString());

//     setState(() {
//       //although _usertransactions is final, we can alter it, because it is a pointer.
//       // we cant do _altertransaction = ... because that will change the ADDRESS, but otherwise we can alter the object itself
//       _userTransactions.add(newTX);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         new_transaction(_addNewTransaction),
//         TransactionList(_userTransactions)
//         ],
//     );
//   }
// }
