import 'package:flutter/material.dart';
import 'package:personal_expenses_flutter/widgets/transaction_list.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';


class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1',
        title: 'New Shoes',
        amount: 69.99,
        date: DateTime.now()
    ),
    Transaction(
        id: 't2',
        title: 'weekly Groceries',
        amount: 69.99,
        date: DateTime.now()
    ),
    Transaction(
        id: 't3',
        title: 'weekly Groceries',
        amount: 69.99,
        date: DateTime.now()
    ),
    Transaction(
        id: 't4',
        title: 'weekly Groceries',
        amount: 69.99,
        date: DateTime.now()
    ),
    Transaction(
        id: 't5',
        title: 'weekly Groceries',
        amount: 69.99,
        date: DateTime.now()
    ),
    Transaction(
        id: 't6',
        title: 'weekly Groceries',
        amount: 69.99,
        date: DateTime.now()
    ),
    Transaction(
        id: 't7',
        title: 'weekly Groceries',
        amount: 69.99,
        date: DateTime.now()
    ),
    Transaction(
        id: 't8',
        title: 'weekly Groceries',
        amount: 69.99,
        date: DateTime.now()
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTx: _addNewTransaction),
        TransactionList(transactions: _userTransaction,)
      ],
    );
  }
}
