
import 'package:expense_new/database_provider/app_database.dart';

class ExpenseModel{

  int? expense_id;
  int uid;
  String expense_title;
  String expense_desc;
  num expense_amt;
  num expense_bal;
  int expense_cat_id;
  int expense_type;
  String expense_date;

  ExpenseModel({
      this.expense_id,
    required  this.uid,
    required  this.expense_title,
    required  this.expense_desc,
    required  this.expense_amt,
     required this.expense_bal,
     required this.expense_cat_id,
     required this.expense_type,
     required this.expense_date});




  factory ExpenseModel.fromMap(Map<String,dynamic> map){
    return ExpenseModel(
        expense_id: map[Appdatabase().EXPENSE_COLUMN_ID],
        uid: map[Appdatabase().USER_COLUMN_ID],
        expense_title: map[ Appdatabase().EXPENSE_COLUMN_TITLE],
        expense_desc: map[Appdatabase().EXPENSE_COLUMN_DESC],
        expense_amt: map[Appdatabase().EXPENSE_COLUMN_AMT],
        expense_bal: map[Appdatabase().EXPENSE_COLUMN_BAL],
        expense_cat_id: map[Appdatabase().EXPENSE_COLUMN_CAT_ID],
        expense_type: map[Appdatabase().EXPENSE_COLUMN_TYPE],
        expense_date: map[Appdatabase().EXPENSE_COLUMN_DATE]);
  }



  Map<String,dynamic>  toMap() =>
      {
        Appdatabase().EXPENSE_COLUMN_ID : expense_id,
        Appdatabase().USER_COLUMN_ID : uid,
        Appdatabase().EXPENSE_COLUMN_TITLE : expense_title,
        Appdatabase().EXPENSE_COLUMN_DESC : expense_desc,
        Appdatabase().EXPENSE_COLUMN_AMT : expense_amt,
        Appdatabase().EXPENSE_COLUMN_BAL : expense_bal,
        Appdatabase().EXPENSE_COLUMN_TYPE : expense_type,
        Appdatabase().EXPENSE_COLUMN_CAT_ID : expense_cat_id,
        Appdatabase().EXPENSE_COLUMN_DATE : expense_date,






      };


  }










