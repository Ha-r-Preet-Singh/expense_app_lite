

import 'package:expense_new/models/expense_model.dart';
import 'package:flutter/material.dart';



@immutable
abstract class ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent{
  ExpenseModel newExpense;
  AddExpenseEvent({required this.newExpense});





}

class FetchAllExpenseEvent extends ExpenseEvent{

}
