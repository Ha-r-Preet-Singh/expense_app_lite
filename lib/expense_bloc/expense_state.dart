part of 'expense_bloc.dart';

@immutable
abstract class ExpenseState {}

class ExpenseInitialState extends ExpenseState {}

class ExpenseLoadingState extends ExpenseState {}

class ExpenseLoadedState extends ExpenseState {
   List<ExpenseModel> arrExpenses;


   ExpenseLoadedState({required this.arrExpenses});





}

class ExpenseErrorState extends ExpenseState {
  String errorMsg ;
  ExpenseErrorState({required this.errorMsg});


}





