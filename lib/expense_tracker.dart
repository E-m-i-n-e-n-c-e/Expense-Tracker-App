import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker(
      {super.key, required this.expenses}); // The text to be displayed

  // The text to be displayed
  final List<Expense> expenses;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Expenses Chart"),
          Container(
            margin: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 6,
            child: ExpensesList(expenses: expenses),
          ),
        ],
      ), // Display the provided text
    );
  }
}
