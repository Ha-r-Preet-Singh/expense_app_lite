import 'package:expense_new/constants/constants.dart';
import 'package:expense_new/constants/constants.dart';
import 'package:expense_new/customs/custom_container.dart';
import 'package:expense_new/customs/custom_text.dart';
import 'package:expense_new/expense_bloc/expense_bloc.dart';
import 'package:expense_new/expense_bloc/expense_event.dart';
import 'package:expense_new/models/expense_model.dart';
import 'package:expense_new/models/filter_expense_model.dart';
import 'package:expense_new/screens/add_transaction/add_trans_page.dart';
import 'package:expense_new/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FilterExpenseModel> arrFilterDateExpenses = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExpenseBloc>().add(FetchAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.onboardingColor,
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (_, state) {
          if (state is ExpenseLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseErrorState) {
            return Center(
              child: Text("${state.errorMsg}"),
            );
          } else if (state is ExpenseLoadedState) {
            var arrData = state.arrExpenses;
            getDateWiseTransaction(arrData);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 10, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [

                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddTransactionPage(),
                                ));
                          },
                          child: CustomContainer(
                            cHeight: media.size.height * .05,
                            cWidth: media.size.width * .11,
                            cColor: AppColors.textfieldColor,
                            cRadius: BorderRadius.circular(50),
                            borderSideColor: AppColors.whiteColor,
                            borderSideWidth: 2,
                            mChild: Icon(
                              Icons.add,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  hSpacer(
                    mHeight: media.size.height * .12,
                  ),
                  Column(
                    children: [
                      CustomText(
                          fText: "Spent this Week",
                          fColor: AppColors.textfieldColor,
                          fSize: 16,
                          fWeight: FontWeight.w600),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 11,
                                ),
                                CustomText(
                                  fText: "\$",
                                  fSize: 34,
                                  fColor: Colors.grey.shade700,
                                  fWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                            CustomText(
                              fText: "295",
                              fSize: 60,
                              fColor: AppColors.textfieldColor,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 11,
                                ),
                                CustomText(
                                    fText: ".95",
                                    fSize: 35,
                                    fColor: AppColors.textfieldColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                      arrFilterDateExpenses.isNotEmpty
                          ? SizedBox(
                              height: media.size.height * .9,
                              child: ListView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount: arrFilterDateExpenses.length,
                                itemBuilder: (_, index) {
                                  // var data = AppConstants.categories
                                  //     .where((element) =>
                                  //         element["id"] ==
                                  //         arrFilterDateExpenses[index].toString()).toList();

                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 40,right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              arrFilterDateExpenses[index].date,
                                              style: mTextStyle20(fFamily: "poppinsbold",),
                                            ),
                                            Text(
                                              arrFilterDateExpenses[index].amt,
                                              style: mTextStyle20(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: arrFilterDateExpenses[index]
                                            .arrExpense
                                            .length,
                                        itemBuilder: (_, subIndex) {
                                          var eachTrans =
                                              arrFilterDateExpenses[index]
                                                  .arrExpense[subIndex];
                                          var img = AppConstants.categories
                                              .firstWhere((element) =>
                                                  element['id'] ==
                                                  eachTrans.expense_cat_id
                                                      .toString())['img'];
                                          return ListTile(
                                            leading: CircleAvatar(
                                              radius: 25,
                                                backgroundColor: AppColors.textfieldColor.withOpacity(0.1),
                                                child: Image.asset(img)),
                                            title: Text(
                                              eachTrans.expense_title,
                                              style: mTextStyle15(fWeight: FontWeight.w600),
                                            ),
                                            subtitle: Text(
                                              eachTrans.expense_desc,
                                              style: mTextStyle12(mColor: AppColors.hintextColor),
                                            ),
                                            trailing: Text(
                                              "\$ ${eachTrans.expense_amt}",
                                              style: mTextStyle15(fWeight: FontWeight.w600),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          : Center(
                              child: Text(
                                "No Expenses Yet",
                                style: mTextStyle15(),
                              ),
                            ),
                    ],
                  ),
                  hSpacer(),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  void getDateWiseTransaction(List<ExpenseModel> data) {
    arrFilterDateExpenses.clear();

    //getUniqueDates
    List<String> arrUniqueDate = [];
    for (ExpenseModel eachTrans in data) {
      var date = DateTime.parse(eachTrans.expense_date);

      var eachDate =
          "${date.day}-${date.month.toString().length < 2 ? "0${date.month}" : date.month}-${date.year}";
      print(eachDate);

      if (!arrUniqueDate.contains(eachDate)) {
        arrUniqueDate.add(eachDate);
      }
    }
    print(arrUniqueDate);

    //2
    for (String eachDate in arrUniqueDate) {
      print("EachDate: $eachDate");

      List<ExpenseModel> eachDateTrans = [];

      num amt = 0;

      for (ExpenseModel eachTrans in data) {
        var date = DateTime.parse(eachTrans.expense_date);

        var mDate =
            "${date.day}-${date.month.toString().length < 2 ? "0${date.month}" : date.month}-${date.year}";

        if (eachDate == mDate) {
          eachDateTrans.add(eachTrans);

          if (eachTrans.expense_type == 0) {
            //debit
            amt -= eachTrans.expense_amt;
          } else {
            //credit
            amt += eachTrans.expense_amt;
          }
        }
      }

      arrFilterDateExpenses.add(FilterExpenseModel(
          date: eachDate, amt: amt.toString(), arrExpense: eachDateTrans));
    }

    for (FilterExpenseModel model in arrFilterDateExpenses) {
      print(
          "Date: ${model.date}\nAmt:${model.amt}\nTrans:${model.arrExpense.length}");
    }
  }
}
