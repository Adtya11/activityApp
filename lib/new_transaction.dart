import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  NewTransactionState createState() => NewTransactionState();
}

class NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

  void presetnDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      selectedDate = value;

      setState(() {
        selectedDate = value;
      });
    });
  }

  void SubmitData() {
    final txAmount = double.parse(amountController.text);

    if (txAmount < 0 || titleController.text.length == 0 || selectedDate == null) {
      return;
    }

    widget.addNewTransaction(titleController.text, txAmount, selectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  controller: titleController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                ),
                Container(
                  height: 70,
                  child: Row(children: <Widget>[
                    Expanded(
                        child: Text(selectedDate == null
                            ? 'No Date Selected!'
                            : 'Selected ${DateFormat.yMd().format(selectedDate)}')),
                    TextButton(
                        onPressed: presetnDatePicker,
                        child: const Text(
                          'Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ]),
                ),
                ElevatedButton(
                    onPressed: SubmitData,
                    child: const Text('Add transaction')),
              ]),
        ));
  }
}
