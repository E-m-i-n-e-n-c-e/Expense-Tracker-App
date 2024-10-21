import 'package:expense_tracker/data/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/add_screen/add_screen.dart';
import 'package:expense_tracker/expense_tracker.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({
    super.key,
  });

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  var registeredExpenses = expenses;

  void addNewExpense(
      String title, String amount, Category category, DateTime date) {
    setState(() {
      registeredExpenses.add(Expense(
        title: title,
        amount: double.parse(amount),
        category: category,
        date: date,
      ));

      // ignore: avoid_print
      print(expenses);
    });
  }

  void submitExpense(
      String title, String amount, Category category, DateTime date) {

    setState(() {
      // ignore: avoid_print
      print("Expense added");
      addNewExpense(title, amount, category, date);
    });
  }

  void addExpense(context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddScreen(submitExpense: submitExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              addExpense(context);
            },
          ),
        ],
      ),
      body: ExpenseTracker(
        expenses: registeredExpenses,
      ),
    );
  }
}
