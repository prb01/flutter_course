import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void _submitForm() {
    final amountDouble = double.tryParse(_amountController.text);
    final isAmountValid = amountDouble != null && amountDouble >= 0;
    Future errorDialog() => showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Invalid input'),
            content: const Text(
                'Please make sure a valid title, amount, date, and category was entered.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Text('Okay'))
            ],
          ),
        );

    if (_titleController.text.trim().isEmpty) {
      errorDialog();
      return;
    }

    if (!isAmountValid) {
      errorDialog();
      return;
    }

    if (_selectedDate == null) {
      errorDialog();
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: amountDouble,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
        child: Column(
          children: [
            if (width > 600)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _titleController,
                      maxLength: 50,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      decoration: const InputDecoration(
                        label: Text("Title"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      decoration: const InputDecoration(
                        prefixText: "\$ ",
                        label: Text("Amount"),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              )
            else
              TextField(
                controller: _titleController,
                maxLength: 50,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                decoration: const InputDecoration(
                  label: Text("Title"),
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    decoration: const InputDecoration(
                      prefixText: "\$ ",
                      label: Text("Amount"),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No date selected'
                            : formatter.format(_selectedDate!),
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      IconButton(
                        onPressed: _showDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                category.name.toUpperCase(),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }

                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("Save Expense"),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
