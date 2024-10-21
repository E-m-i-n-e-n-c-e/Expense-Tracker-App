import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/add_screen/category_dropdown.dart';
import 'package:flutter/material.dart';

class AddScreenButtons extends StatelessWidget {
  const AddScreenButtons({
    super.key,
    required this.titleController,
    required this.amountController,
    required this.addScreenContext,
    required this.selectedDate,
    required this.submitExpense,
  });

  final void Function(String, String, Category, DateTime)? submitExpense;
  final DateTime? selectedDate;
  final BuildContext addScreenContext;
  final TextEditingController titleController;
  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    Category? selectedCategory;
    void setCategory(Category category) {
      selectedCategory = category;
    }

    return Row(
      children: [
        CategoryDropdown(
          setCategory: setCategory,
        ),
        const Spacer(),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
          ),
          onPressed: () {
            Navigator.of(addScreenContext).pop();
          },
          child: const Text("Cancel "),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
          ),
          onPressed: () {
            final title = titleController.text;
            final amount = amountController.text;
            final category = selectedCategory;

            // ignore: avoid_print
            print(
                "Title: $title, Amount: $amount, Category: $category, Date: $selectedDate");

            if (title.isEmpty ||
                double.tryParse(amount) == null ||
                category == null ||
                selectedDate == null) {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: const Text("Invalid Input"),
                        content: const Text("Please enter valid input"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("Okay"),
                          ),
                        ],
                      ));
              return;
            }
            if (submitExpense != null) {
              submitExpense!(
                title,
                amount,
                category,
                selectedDate!,
              );
            }
            Navigator.of(addScreenContext).pop();
          },
          child: const Text("Add Transaction"),
        ),
      ],
    );
  }
}
