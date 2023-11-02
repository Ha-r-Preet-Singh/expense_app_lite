import 'package:expense_new/customs/custom_Elevated_Button.dart';
import 'package:expense_new/customs/custom_container.dart';
import 'package:expense_new/customs/custom_text.dart';
import 'package:expense_new/customs/custom_textfield.dart';
import 'package:expense_new/database_provider/app_database.dart';
import 'package:expense_new/screens/onboading/login_screen.dart';
import 'package:expense_new/ui_helper.dart';
import 'package:flutter/material.dart';


class ResetPassword extends StatefulWidget {
  String email;


  ResetPassword({required this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var orientation;
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if(orientation == Orientation.portrait){
            return Form(
              key: portraitKey,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/originals/54/bd/ea/54bdea150e1dad3bc3586e7ab70f8fb7.png"),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: CustomContainer(
                    cHeight: media.size.height * .4,
                    cWidth: media.size.width * .9,
                    cColor: AppColors.begniColor.withOpacity(.3),
                    cRadius: BorderRadius.circular(20),
                    borderSideColor: AppColors.whiteColor,
                    borderSideWidth: 1,
                    mChild: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(

                        children: [
                          CustomText(
                              fText: "Forget Password",
                              fSize: 35,
                              fFamily: "poppinsbold",
                              fColor: AppColors.whiteColor),
                          hSpacer(mHeight: media.size.height*.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: media.size.height * .056,
                                width: media.size.width * .75,
                                child: CustomTextField(
                                  hintTxt: "Pick a new Password",
                                  suffIcon: Icons.visibility_off_outlined,
                                  validate: (value) {
                                    if (value == "" || value!.length < 5) {
                                      return
                                        "Please enter a valid Password(Password must be 6 Characters)";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              hSpacer(mHeight: media.size.height*.03),
                              SizedBox(
                                height: media.size.height * .056,
                                width: media.size.width * .75,
                                child: CustomTextField(
                                  hintTxt: "Confirm Password",
                                  suffIcon: Icons.visibility_off_outlined,
                                  validate: (value) {
                                    if (value == "" || value!.length < 5) {
                                      return
                                        "Please enter a valid Password(Password must be 6 Characters)";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),


                            ],
                          ),
                          hSpacer(mHeight: media.size.height*.06),
                          SizedBox(
                            height: media.size.height * .04,
                            width: media.size.width * .37,
                            child: CustomElevatedButton(
                              onTap: () async{
                                if (portraitKey.currentState!.validate()) {
                                  var check = await Appdatabase().resetPassword(passwordController.text, widget.email);


                                  if(check){

                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginScreen() ,));
                                  }

                                }
                              },
                              mChild: CustomText(
                                fText: "Continue",
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
          }else{
            return Form(
              key: landscapeKey,
              child: Container(
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
                    mChild: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(

                        children: [
                          CustomText(
                              fText: "Reset Password",
                              fSize: 30,
                              fFamily: "poppinsbold",
                              fColor: AppColors.whiteColor),
                          hSpacer(mHeight: media.size.height*.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: media.size.height*.12,
                                width: media.size.width * .75,
                                child: CustomTextField(
                                  hintTxt: "Pick a new Password",
                                  suffIcon: Icons.visibility_off_outlined,
                                  validate: (value) {
                                    if (value == "" || value!.length < 5) {
                                      return
                                        "Please enter a valid Password(Password must be 6 Characters)";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              hSpacer(mHeight: media.size.height*.035),
                              SizedBox(
                                height: media.size.height*.12,
                                width: media.size.width * .75,
                                child: CustomTextField(
                                  hintTxt: "Pick a new Password",
                                  suffIcon: Icons.visibility_off_outlined,
                                  validate: (value) {
                                    if (value == "" || value!.length < 5) {
                                      return
                                        "Please enter a valid Password(Password must be 6 Characters)";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),


                            ],
                          ),
                          hSpacer(mHeight: media.size.height*.06),
                          SizedBox(
                            height: media.size.height*.1,
                            width: media.size.width * .33,
                            child: CustomElevatedButton(
                              onTap: () async{
                                if (portraitKey.currentState!.validate()) {
                                  var check = await Appdatabase().resetPassword(passwordController.text, widget.email);


                                  if(check){

                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginScreen() ,));
                                  }

                                }
                              },
                              mChild: CustomText(
                                fText: "Continue",
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

        },
      ),

    );
  }
}
