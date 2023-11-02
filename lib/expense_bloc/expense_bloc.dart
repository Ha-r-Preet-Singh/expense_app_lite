



import 'package:expense_new/database_provider/app_database.dart';
import 'package:expense_new/expense_bloc/expense_event.dart';
import 'package:expense_new/models/expense_model.dart';



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'expense_event.dart';

part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent,ExpenseState>{
  Appdatabase db ;
  ExpenseBloc({required this.db}) : super(ExpenseInitialState()) {

    on<AddExpenseEvent>((event, emit)async {
      emit(ExpenseLoadingState());
      var check = await db.addNewNote(event.newExpense);
      if(check){
        var data = await db.getAllExpenses();
        emit(ExpenseLoadedState(arrExpenses: data));

      }else{
        emit(ExpenseErrorState(errorMsg: "Expenses Not Added!!"));
      }



    });



    on<FetchAllExpenseEvent>((event, emit)async {
      emit(ExpenseLoadingState());
      var data = await db.getAllExpenses();
      emit(ExpenseLoadedState(arrExpenses: data));

    });


  }
}
