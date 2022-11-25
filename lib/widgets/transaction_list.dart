import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
   const TransactionList({
     Key? key,
     required this.transactions
   }) : super(key: key);

   final List<Transaction> transactions;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isNotEmpty
      ?ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text( '\$${transactions[index].amount}', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor
                  ),),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor ,
                          width: 2
                      )
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transactions[index].title, style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                    Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                      style: TextStyle(
                          color: Colors.grey
                      ),)
                  ],
                )
              ],
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
