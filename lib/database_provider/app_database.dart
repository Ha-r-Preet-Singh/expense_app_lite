import 'package:expense_new/models/expense_model.dart';
import 'package:expense_new/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Appdatabase {
  var USER_TABLE = "user";
  var USER_COLUMN_ID = "uid";
  var USER_COLUMN_EMAIL = "email";
  var USER_COLUMN_PASSWORD = "password";

  //Expense table

  var EXPENSE_TABLE = "expense";
  // var USER_COLUMN_ID = "uid";
  var EXPENSE_COLUMN_ID = "expense_id";
  var EXPENSE_COLUMN_TITLE = "expense_title";
  var EXPENSE_COLUMN_DESC = "expense_desc";
  var EXPENSE_COLUMN_AMT = "expense_amt";
  var EXPENSE_COLUMN_BAL = "expense_bal";
  var EXPENSE_COLUMN_TYPE = "expense_type"; //0 for debit and 1 for cradit..
  var EXPENSE_COLUMN_CAT_ID = "expense_cat_id";
  var EXPENSE_COLUMN_DATE = "expense_date"; //current milli stored here...

  Future<Database> openDB() async {
    //directory Path
    var mDirectory = await getApplicationDocumentsDirectory();

    //created the Path
    await mDirectory.create(recursive: true);

    var dbPath = "$mDirectory/mainDB.db";

    return await openDatabase(dbPath, version: 1,
        onCreate: (db, version) async {
      var createTableQuery =
          "create table $USER_TABLE ($USER_COLUMN_ID integer primary key autoincrement , $USER_COLUMN_EMAIL text unique , $USER_COLUMN_PASSWORD text)";

      var createExpenseQuery =
          "create table $EXPENSE_TABLE ($EXPENSE_COLUMN_ID integer primary key autoincrement , $USER_COLUMN_ID integer,$EXPENSE_COLUMN_TITLE text , $EXPENSE_COLUMN_DESC text, $EXPENSE_COLUMN_AMT real,$EXPENSE_COLUMN_BAL real,$EXPENSE_COLUMN_TYPE integer,$EXPENSE_COLUMN_CAT_ID integer,$EXPENSE_COLUMN_DATE text )";

      await db.execute(createTableQuery);
      await db.execute(createExpenseQuery);
    });
  }

  Future<bool> createUser(UserModel user) async {
    var db = await openDB();

    if (await checkEmailAlreadyExists(user.email)) {
      return false;
    } else {
      var check = await db.insert(USER_TABLE, user.toMap());
      return check > 0;
    }
  }

  Future<bool> checkEmailAlreadyExists(String email) async {
    var db = await openDB();

    var check = await db
        .query(USER_TABLE, where: "$USER_COLUMN_EMAIL = ?", whereArgs: [email]);
    return check.isNotEmpty;
  }

  Future<bool> authenticateUser(
      {required String email, required String password}) async {
    var db = await openDB();
    var check = await db.query(USER_TABLE,
        where: "$USER_COLUMN_EMAIL = ? and $USER_COLUMN_PASSWORD = ?",
        whereArgs: [email, password]);
    return check.isNotEmpty;
  }

  Future<bool> forgetPassword(String email) async {
    return await checkEmailAlreadyExists(email);
  }

  Future<bool> resetPassword(String newPassword, String email) async {
    var db = await openDB();
    var check = await db.update(USER_TABLE, {USER_COLUMN_PASSWORD: newPassword},
        where: "$USER_COLUMN_EMAIL = ?", whereArgs: [email]);
    return check > 0;
  }

  Future<bool> addNewNote(ExpenseModel newExpense) async {
    var db = await openDB();

    var check = await db.insert(EXPENSE_TABLE, newExpense.toMap());

    return check > 0;
  }

  Future<List<ExpenseModel>> getAllExpenses() async {
    var db = await openDB();

    List<Map<String, dynamic>> expenses = await db.query(EXPENSE_TABLE);

    List<ExpenseModel> arrExpenses = [];
    for (Map<String, dynamic> eachExpenses in expenses) {
      var eachModel = ExpenseModel.fromMap(eachExpenses);

      arrExpenses.add(eachModel);
    }
    return arrExpenses;
  }
}
