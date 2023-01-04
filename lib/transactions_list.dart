import 'dart:io';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 377,
      child: transactions.isEmpty
          ? Column(children: <Widget>[
              const Text('No transactions yet!'),
              Container(
                height: 250,
                  child: Image.asset(
                'assets/images/129.jpg',
                fit: BoxFit.cover,
              ))
            ])
          : ListView.builder(
              itemBuilder: ((context, index) {
                return Card(
                  child: Row(children: [
                    Container(
                      // ignore: sort_child_properties_last
                      child: Text(
                        '\$' + transactions[index].amount.toStringAsFixed(2),
                        style: const TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.pinkAccent, width: 2)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transactions[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                          style: TextStyle(color: Colors.black54),
                        )
                      ],
                    )
                  ]),
                );
              }),
              itemCount: transactions.length,
            ),
    );
  }
}
