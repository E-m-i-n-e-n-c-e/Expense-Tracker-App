import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({
    super.key,
    this.setCategory,
  });

  final Function? setCategory;

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  Category selectedCategory = Category.food;

  @override
  Widget build(BuildContext context) {
    if (widget.setCategory != null) widget.setCategory!(selectedCategory);

    return DropdownButton(
      value: selectedCategory,
      items: Category.values
          .map((category) => DropdownMenuItem(
                value: category,
                child: Row(
                  children: [
                    categoryIcons[category]!,
                    const SizedBox(width: 3),
                    Text(category.name.toUpperCase()),
                  ],
                ),
              ))
          .toList(),
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          selectedCategory = value;
          widget.setCategory != null ? widget.setCategory!(value) : null;
        });
      },
    );
  }
}
