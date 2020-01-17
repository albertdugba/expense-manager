import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;

    if (enteredTitle.isEmpty || enteredAmount.length <= 0) return;

    widget.addTx(enteredTitle, double.parse(enteredAmount));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 7,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Title', hintText: 'Please enter a title'),
              onSubmitted: (_) => submitData,
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Amount', hintText: 'Please enter an amount'),
              onSubmitted: (_) => submitData,
            ),
            Container(
              height: 70.0,
              child: Row(
                children: <Widget>[
                  Text('No Date Chosen'),
                  FlatButton(
                      textColor: theme.primaryColor,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
            RaisedButton(
              textColor: Theme.of(context).accentColor,
              elevation: 9,
              color: theme.primaryColor,
              child: Text('Add Transaction'),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
