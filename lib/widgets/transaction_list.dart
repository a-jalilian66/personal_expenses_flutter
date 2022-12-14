import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
   const TransactionList({
     Key? key,
     required this.deleteTx,
     required this.transactions
   }) : super(key: key);

   final List<Transaction> transactions;
   final Function deleteTx;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isNotEmpty
      ?ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}'),
                  ),
                ),
              ),
              title: Text(transactions[index].title, style: Theme.of(context).textTheme.titleMedium,),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
              trailing: IconButton(
                onPressed: () {
                  deleteTx(transactions[index].id);
                },
                icon: Icon(Icons.delete, color: Colors.red,),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      )
      : Column(
        children: [
          Text('No transactions added yet!'),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,),
          )
        ],
      ),
    );
  }
}
