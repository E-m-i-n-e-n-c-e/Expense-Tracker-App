import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class DatePicker extends StatefulWidget {
  const DatePicker(
    this.context, {
    this.setSelectedDate,
    super.key,
  });

  final Function? setSelectedDate;
  final BuildContext context;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;

  void addDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);
    setState(
      () {
        if (pickedDate != null) {
          selectedDate = pickedDate;
          widget.setSelectedDate != null
              ? widget.setSelectedDate!(pickedDate)
              : null;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(selectedDate == null
            ? "Pick Date"
            : formatter.format(selectedDate!)),
        IconButton(icon: const Icon(Icons.calendar_month), onPressed: addDate),
      ],
    );
  }
}
