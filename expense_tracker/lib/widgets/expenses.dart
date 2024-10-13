import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "flutter course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "flight",
        amount: 487.91,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: "Claude AI",
        amount: 20,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Thai",
        amount: 40.23,
        date: DateTime.now(),
        category: Category.food),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
