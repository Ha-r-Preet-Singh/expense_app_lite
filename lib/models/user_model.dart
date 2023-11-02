

import 'package:expense_new/database_provider/app_database.dart';

class UserModel {
  int? uid;
  String email;
  String password;

  UserModel({
    this.uid,
     required this.email,
     required this.password,
  });



  factory UserModel.fromMap(Map<String,dynamic>map){
    return UserModel(
        uid:map[Appdatabase().USER_COLUMN_ID],
        email: map[Appdatabase().USER_COLUMN_EMAIL],
        password: map[Appdatabase().USER_COLUMN_PASSWORD],
    );

  }

  Map<String,dynamic> toMap(){
    return {
      Appdatabase().USER_COLUMN_ID:uid,
      Appdatabase().USER_COLUMN_EMAIL:email,
      Appdatabase().USER_COLUMN_PASSWORD:password,

    };

  }




}

