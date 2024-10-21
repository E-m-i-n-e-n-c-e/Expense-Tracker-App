import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:uuid/uuid.dart";

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

final Map<Category, Icon> categoryIcons = {
  Category.food: const Icon(Icons.fastfood),
  Category.leisure: const Icon(Icons.movie),
  Category.work: const Icon(Icons.work),
  Category.travel: const Icon(Icons.flight_takeoff),
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Icon get categoryIcon {
    return categoryIcons[category] as Icon;
  }

  String get formattedDate {
    return formatter.format(date);
    // return "${date.day}/${date.month}/${date.year}";
  }
}

// flutter pub add uuid
// flutter pub add intl