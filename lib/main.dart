import 'package:expense_new/database_provider/app_database.dart';
import 'package:expense_new/expense_bloc/expense_bloc.dart';
import 'package:expense_new/screens/home/home_screen.dart';
import 'package:expense_new/screens/onboading/login_screen.dart';
import 'package:expense_new/screens/onboading/signup_screen.dart';
import 'package:expense_new/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ExpenseBloc(db: Appdatabase()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),

    );
  }
}
