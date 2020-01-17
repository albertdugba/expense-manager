import 'package:expense/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        height: 300.0,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text('No transactions added yet',
                      style: theme.textTheme.title)
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (BuildContext context, idx) {
                  return Card(
                    margin: EdgeInsets.all(9),
                    elevation: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.primaryColor,
                        radius: 30.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                              child: Text('\$${transactions[idx].amount}')),
                        ),
                      ),
                      title: Text(transactions[idx].title,
                          style: theme.textTheme.title),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[idx].date)),
                      trailing: IconButton(
                        color: theme.errorColor,
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
              ));
  }
}
