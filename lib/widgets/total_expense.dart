import 'package:flutter/material.dart';

class TotalExpenses extends StatelessWidget {
  const TotalExpenses({super.key,required this.totalExpense});
  final double totalExpense;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 25),
        child: Text(
          'Total Expenses  \n\n₹ $totalExpense',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

