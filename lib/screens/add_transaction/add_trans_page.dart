import 'package:expense_new/constants/constants.dart';
import 'package:expense_new/customs/custom_Elevated_Button.dart';
import 'package:expense_new/customs/custom_container.dart';
import 'package:expense_new/customs/custom_text.dart';
import 'package:expense_new/customs/custom_textfield.dart';
import 'package:expense_new/expense_bloc/expense_bloc.dart';
import 'package:expense_new/expense_bloc/expense_event.dart';
import 'package:expense_new/models/expense_model.dart';
import 'package:expense_new/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  var orientation;
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var descController = TextEditingController();
  var amtController = TextEditingController();

  var selectedCat = -1;
  List<String> arrTranctionType = ["Debit", "Credit"];
  String selectedTransactionType = "Debit";

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.onboardingColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/originals/54/bd/ea/54bdea150e1dad3bc3586e7ab70f8fb7.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: CustomContainer(

            cHeight: media.size.height * .8,
            cWidth: media.size.width * .9,
            cColor: AppColors.begniColor.withOpacity(.3),
            cRadius: BorderRadius.circular(20),
            borderSideColor: AppColors.whiteColor,
            borderSideWidth: 1,
            mChild: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: CustomText(
                        fText: "Add Transaction",
                        fSize: 35,
                        fFamily: "poppinsbold",
                        fColor: AppColors.whiteColor),
                  ),
                  hSpacer(mHeight: media.size.height * .04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: media.size.height * .056,
                          width: media.size.width * .75,
                          child: CustomTextField(
                            TextEditContoller: titleController,
                            hintTxt: "title",
                            validate: (value) {},
                          )),
                      hSpacer(mHeight: media.size.height * .03),
                      SizedBox(
                        height: media.size.height * .056,
                        width: media.size.width * .75,
                        child: CustomTextField(
                          TextEditContoller: descController,
                          hintTxt: "description",
                          validate: (value) {},
                        ),
                      ),
                      hSpacer(mHeight: media.size.height * .03),
                      SizedBox(
                        height: media.size.height * .056,
                        width: media.size.width * .75,
                        child: CustomTextField(
                          TextEditContoller: amtController,
                          hintTxt: "Amount",
                          validate: (value) {},
                        ),
                      ),
                      hSpacer(mHeight: media.size.height * .05),
                      CustomContainer(
                        onTap: () async {
                          showModalBottomSheet(
                              backgroundColor: AppColors.whiteColor,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                              ),
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: SizedBox(
                                    height: media.size.height * .3,
                                    child: GridView.builder(
                                      itemCount: AppConstants.categories.length,
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: InkWell(
                                            onTap: () {
                                              // selectedCat = index;
                                              setState(() {
                                                selectedCat = index;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Column(children: [
                                              Image.asset(
                                                AppConstants.categories[index]
                                                ["img"],
                                                width: media.size.width * .09,
                                                height: media.size.height * .05,
                                              ),
                                              hSpacer(),
                                              CustomText(
                                                fText: AppConstants
                                                    .categories[index]["name"],
                                                fFamily: "poppinsbold",
                                                fColor: AppColors.buttonColor,
                                                fSize: 10,
                                              ),
                                            ]),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              });
                        },
                        cHeight: media.size.height * .06,
                        cWidth: media.size.width * .76,
                        cColor: AppColors.begniColor.withOpacity(.3),
                        cRadius: BorderRadius.circular(15),
                        borderSideColor: AppColors.whiteColor,
                        borderSideWidth: 1,
                        mChild: selectedCat >= 0
                            ? Row(
                          mainAxisAlignment: MainAxisAlignment.center
                          ,
                          children: [
                            Image.asset(
                              AppConstants.categories[selectedCat]["img"],
                              width: media.size.width * .09,
                              height: media.size.height * .05,
                            ),
                            wSpacer(),
                            CustomText(
                              fText: AppConstants.categories[selectedCat]
                              ["name"],
                              fFamily: "poppinsbold",
                              fColor: AppColors.whiteColor,
                              fSize: 20,
                            ),
                          ],
                        )
                            : Center(
                              child: CustomText(
                          fText: "Choose Category",
                          fFamily: "poppinsbold",
                          fColor: AppColors.whiteColor,
                          fSize: 20,
                        ),
                            ),

                      ),
                      // hSpacer(mHeight: media.size.height * .05),
                      // SizedBox(
                      //   height: media.size.height * .060,
                      //   width: media.size.width * .75,
                      //   child: CustomElevatedButton(
                      //
                      //     onTap: () async {
                      //       showModalBottomSheet(
                      //           backgroundColor: AppColors.whiteColor,
                      //           context: context,
                      //           shape: const RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.only(
                      //                 topLeft: Radius.circular(30),
                      //                 topRight: Radius.circular(30)),
                      //           ),
                      //           builder: (context) {
                      //             return Padding(
                      //               padding: const EdgeInsets.only(top: 30),
                      //               child: SizedBox(
                      //                 height: media.size.height * .3,
                      //                 child: GridView.builder(
                      //                   itemCount: AppConstants.categories.length,
                      //                   gridDelegate:
                      //                       SliverGridDelegateWithFixedCrossAxisCount(
                      //                           crossAxisCount: 4),
                      //                   itemBuilder: (context, index) {
                      //                     return Padding(
                      //                       padding: const EdgeInsets.all(12.0),
                      //                       child: InkWell(
                      //                         onTap: () {
                      //                           selectedCat = index;
                      //                           setState(() {});
                      //                           Navigator.pop(context);
                      //                         },
                      //                         child: Column(children: [
                      //                           Image.asset(
                      //                             AppConstants.categories[index]
                      //                                 ["img"],
                      //                             width: media.size.width * .09,
                      //                             height: media.size.height * .05,
                      //                           ),
                      //                           hSpacer(),
                      //                           CustomText(
                      //                             fText: AppConstants
                      //                                 .categories[index]["name"],
                      //                             fFamily: "poppinsbold",
                      //                             fColor: AppColors.buttonColor,
                      //                             fSize: 12,
                      //                           ),
                      //                         ]),
                      //                       ),
                      //                     );
                      //                   },
                      //                 ),
                      //               ),
                      //             );
                      //           });
                      //     },
                      //     mChild: selectedCat >= 0
                      //         ? Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Image.asset(
                      //                 AppConstants.categories[selectedCat]["img"],
                      //                 width: media.size.width * .09,
                      //                 height: media.size.height * .05,
                      //               ),
                      //               wSpacer(),
                      //               CustomText(
                      //                 fText: AppConstants.categories[selectedCat]
                      //                     ["name"],
                      //                 fFamily: "poppinsbold",
                      //                 fColor: AppColors.whiteColor,
                      //                 fSize: 20,
                      //               ),
                      //             ],
                      //           )
                      //         : CustomText(
                      //             fText: "Choose Category",
                      //             fFamily: "poppinsbold",
                      //             fColor: AppColors.whiteColor,
                      //             fSize: 20,
                      //           ),
                      //     ButtonRadius: BorderRadius.circular(15),
                      //     ButtonColor: AppColors.buttonColor,
                      //
                      //   ),
                      // ),
                      hSpacer(mHeight: media.size.height * .04),
                      DropdownButton(
                        elevation: 12,
                        focusColor: AppColors.textfieldColor,
                        borderRadius: BorderRadius.circular(20),
                       iconEnabledColor: AppColors.splashColor,
                        
                        dropdownColor: AppColors.textfieldColor,
                        style: mTextStyle15(
                          fFamily: "poppinsbold",
                          mColor: AppColors.hintextColor,


                        ),
                        value: selectedTransactionType,
                        items: arrTranctionType
                            .map((e) => DropdownMenuItem(

                          child: Text(e),value: e,
                        ))
                            .toList(),
                        onChanged: (value) {
                          selectedTransactionType = value!;
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
                  hSpacer(mHeight: media.size.height * .05),
                  SizedBox(
                    height: media.size.height * .060,
                    width: media.size.width * .75,
                    child: CustomElevatedButton(
                      onTap: () async {
                        context.read<ExpenseBloc>().add(AddExpenseEvent(newExpense: ExpenseModel(
                         uid: 1,
                          expense_title: titleController.text.toString(),
                          expense_desc: descController.text.toString(),
                          expense_amt: int.parse(amtController.text.toString()),
                          expense_bal: 0,
                          expense_cat_id: int.parse(AppConstants.categories[selectedCat]["id"]),
                          expense_type: selectedTransactionType == "Debit"?0:1,
                          expense_date: DateTime.now().toString(),



                        )));
                        Navigator.pop(context);

                      },
                      mChild: CustomText(
                        fText: "Add Your Transactions",
                        fFamily: "poppinsbold",
                        fColor: AppColors.whiteColor,
                        fSize: 20,
                      ),
                      ButtonRadius: BorderRadius.circular(15),
                      ButtonColor: AppColors.buttonColor,
                    ),
                  ),
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
