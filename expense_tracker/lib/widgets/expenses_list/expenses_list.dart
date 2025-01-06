import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(int expenseIndex, Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, idx) => Dismissible(
        key: ValueKey(expenses[idx]),
        background: Container(
          alignment: Alignment.centerRight,
          color: Theme.of(context).colorScheme.errorContainer,
          margin: Theme.of(context).cardTheme.margin,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12,
            ),
            child: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => onRemoveExpense(idx, expenses[idx]),
        child: ExpenseItem(expense: expenses[idx]),
      ),
    );
  }
}
