import 'package:flutter/material.dart';
import 'package:personal_expenses_flutter/widgets/new_transaction.dart';
import 'package:personal_expenses_flutter/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'OpenSans',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransaction = [
    // Transaction(
    //     id: 't1',
    //     title: 'New Shoes',
    //     amount: 69.99,
    //     date: DateTime.now()
    // ),
    // Transaction(
    //     id: 't2',
    //     title: 'weekly Groceries',
    //     amount: 69.99,
    //     date: DateTime.now()
    // ),
    // Transaction(
    //     id: 't3',
    //     title: 'weekly Groceries',
    //     amount: 69.99,
    //     date: DateTime.now()
    // ),
    // Transaction(
    //     id: 't4',
    //     title: 'weekly Groceries',
    //     amount: 69.99,
    //     date: DateTime.now()
    // ),
    // Transaction(
    //     id: 't5',
    //     title: 'weekly Groceries',
    //     amount: 69.99,
    //     date: DateTime.now()
    // ),
    // Transaction(
    //     id: 't6',
    //     title: 'weekly Groceries',
    //     amount: 69.99,
    //     date: DateTime.now()
    // ),
    // Transaction(
    //     id: 't7',
    //     title: 'weekly Groceries',
    //     amount: 69.99,
    //     date: DateTime.now()
    // ),
    // Transaction(
    //     id: 't8',
    //     title: 'weekly Groceries',
    //     amount: 69.99,
    //     date: DateTime.now()
    // ),
  ];

  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction(addTx: _addNewTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: [
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('CHART!'),
              ),
            ),
            TransactionList(transactions: _userTransaction,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
