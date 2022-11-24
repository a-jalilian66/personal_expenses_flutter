import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key, required this.addTx}) : super(key: key);

  final Function addTx;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Title'
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount'
              ),
              controller:  amountController,
            ),
            ElevatedButton(
              onPressed: () {
                addTx(
                    titleController.text,
                    double.parse(amountController.text)
                );
              },
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
