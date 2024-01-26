import 'package:flutter/material.dart';
import 'package:pragti/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title,style: const TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 17),
            Row(
              children: [
                Text(
                  '₹ ${expense.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Row(children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 8),
                  Text(expense.formattedDate),
                ],)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
