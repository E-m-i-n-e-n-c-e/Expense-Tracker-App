import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseView extends StatelessWidget {
  const ExpenseView(this.expense, {super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                // const Expanded(child: Text("")),
                const Spacer(),
                expense.categoryIcon,
                const SizedBox(width: 5),
                Text(expense.formattedDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
