import 'package:expense_tracker/models/expense.dart';

final List<Expense> expenses = [
  Expense(
    title: "Groceries",
    amount: 50.0,
    date: DateTime.now(),
    category: Category.food,
  ),
  Expense(
    title: "Taxi",
    amount: 30.0,
    date: DateTime.now(),
    category: Category.travel,
  ),
  Expense(
    title: "Movie",
    amount: 20.0,
    date: DateTime.now(),
    category: Category.leisure,
  ),
  Expense(
    title: "Laptop",
    amount: 1000.0,
    date: DateTime.now(),
    category: Category.work,
  ),
];
