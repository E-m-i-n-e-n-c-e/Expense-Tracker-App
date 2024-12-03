import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/add_screen/add_screen_buttons.dart';
import 'package:expense_tracker/widgets/add_screen/date_picker.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key, this.submitExpense});

  final void Function(String, String, Category, DateTime)? submitExpense;
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void setSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Amount",
                    prefixText: '\$',
                  ),
                  maxLength: 10,
                ),
              ),
              const SizedBox(width: 85),
              DatePicker(
                context,
                setSelectedDate: setSelectedDate,
              ),
            ],
          ),
          const SizedBox(height: 10),
          AddScreenButtons(
            titleController: titleController,
            amountController: amountController,
            addScreenContext: context,
            selectedDate: selectedDate,
            submitExpense: widget.submitExpense,
          ),
        ],
      ),
    );
  }
}
