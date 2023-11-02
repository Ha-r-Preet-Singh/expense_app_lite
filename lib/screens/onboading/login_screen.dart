import 'package:expense_new/customs/custom_Elevated_Button.dart';
import 'package:expense_new/customs/custom_container.dart';
import 'package:expense_new/customs/custom_textfield.dart';
import 'package:expense_new/database_provider/app_database.dart';
import 'package:expense_new/screens/onboading/forget_password.dart';
import 'package:expense_new/screens/home/home_screen.dart';
import 'package:expense_new/screens/onboading/signup_screen.dart';
import 'package:expense_new/screens/splash/splash_screen.dart';
import 'package:expense_new/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../customs/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var orientation;
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.onboardingColor,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
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
                    cHeight: media.size.height * .8,
                    cWidth: media.size.width * .9,
                    cColor: AppColors.begniColor.withOpacity(.3),
                    cRadius: BorderRadius.circular(20),
                    borderSideColor: AppColors.whiteColor,
                    borderSideWidth: 1,
                    mChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                            fText: "Welcome Back",
                            fSize: 35,
                            fFamily: "poppinsbold",
                            fColor: AppColors.whiteColor),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                                height: media.size.height * .056,
                                width: media.size.width * .79,
                                child: CustomTextField(
                                  hintTxt: "Email address",
                                  validate: (value) {
                                    if (value == "" || !value!.contains("@")) {
                                     return
                                          "Please enter a valid email address";
                                    } else {
                                      return null;
                                    }
                                  },
                                )),
                            hSpacer(mHeight: media.size.height*.03),
                            SizedBox(
                              height: media.size.height * .056,
                              width: media.size.width * .79,
                              child: CustomTextField(
                                hintTxt: "Password",
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
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword(),));
                              },
                              child: CustomText(
                                fText: "Forget Password?",
                                fColor: AppColors.hintextColor,
                                fFamily: "poppinsbold",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: media.size.height * .04,
                          width: media.size.width * .33,
                          child: CustomElevatedButton(
                            onTap: () async{
                              if (portraitKey.currentState!.validate()) {
                                var check =await Appdatabase().authenticateUser(
                                    email: emailController.text,
                                    password: passwordController.text,
                                );


                                if(check){
                                  var prefs = await SharedPreferences.getInstance();
                                  prefs.setBool(LOGIN_KEY, true);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen() ,));
                                }

                              }
                            },
                            mChild: CustomText(
                              fText: "Login",
                              fFamily: "poppinsbold",
                              fColor: AppColors.whiteColor,
                              fSize: 20,
                            ),
                            ButtonRadius: BorderRadius.circular(15),
                            ButtonColor: AppColors.buttonColor,
                          ),
                        ),
                        Column(
                          children: [
                            CustomText(
                              fText: "continue with",
                              fColor: AppColors.hintextColor,
                              fFamily: "poppinsbold",
                            ),
                            hSpacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  "https://www.facebook.com/images/fb_icon_325x325.png",
                                  scale: 8,
                                ),
                                wSpacer(mWidth: media.size.width*.095),
                                Image.network(
                                  "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                                  scale: 8,
                                ),
                                wSpacer(mWidth: media.size.width*.095),
                                Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/512px-Logo_of_Twitter.svg.png?20220821125553",
                                  scale: 10,
                                ),
                              ],
                            ),
                            hSpacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  fText: "Don't have account ?",
                                  fColor: AppColors.hintextColor,
                                  fFamily: "poppinsbold",
                                ),
                                wSpacer(mWidth: media.size.width*.02),
                                InkWell(
                                  onTap: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                                  },
                                  child: CustomText(
                                    fText: "Sign up",
                                    fColor: AppColors.hintextColor,
                                    fFamily: "poppinsbold",
                                    underText: TextDecoration.underline,
                                    fSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
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
                    mChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                            fText: "Welcome Back",
                            fSize: 30,
                            fFamily: "poppinsbold",
                            fColor: AppColors.whiteColor),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                                height: media.size.height*.12,
                                width: media.size.width * .75,
                                child: CustomTextField(
                                  hintTxt: "Email address",
                                  validate: (value) {
                                    if (value == "" || !value!.contains("@")) {
                                      return
                                          "Please enter a valid email address";
                                    } else {
                                      return null;
                                    }
                                  },
                                )),
                            hSpacer(mHeight: media.size.height*.035),
                            SizedBox(
                              height: media.size.height*.12,
                              width: media.size.width * .75,
                              child: CustomTextField(
                                hintTxt: "Password",
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
                            hSpacer(),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword(),));
                              },
                              child: CustomText(
                                fText: "Forget Password?",
                                fColor: AppColors.hintextColor,
                                fFamily: "poppinsbold",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: media.size.height*.1,
                                  width: media.size.width * .33,
                                  child: CustomElevatedButton(
                                    onTap: () async{
                                      if (landscapeKey.currentState!.validate()) {
                                        var check =await Appdatabase().authenticateUser(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );


                                        if(check){
                                          var prefs = await SharedPreferences.getInstance();
                                          prefs.setBool(LOGIN_KEY, true);
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen() ,));
                                        }

                                      }
                                    },
                                    mChild: CustomText(
                                      fText: "Login",
                                      fFamily: "poppinsbold",
                                      fColor: AppColors.whiteColor,
                                      fSize: 20,
                                    ),
                                    ButtonRadius: BorderRadius.circular(15),
                                    ButtonColor: AppColors.buttonColor,
                                  ),
                                ),
                                hSpacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      fText: "Don't have account ?",
                                      fColor: AppColors.hintextColor,
                                      fFamily: "poppinsbold",
                                    ),
                                    wSpacer(mWidth: media.size.width*.01),
                                    InkWell(
                                      onTap: (){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                                      },
                                      child: CustomText(
                                        fText: "Sign up",
                                        fColor: AppColors.hintextColor,
                                        fFamily: "poppinsbold",
                                        underText: TextDecoration.underline,
                                        fSize: 17,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            wSpacer(mWidth: media.size.width*.1),
                            Column(
                              children: [
                                CustomText(
                                  fText: "continue with",
                                  fColor: AppColors.hintextColor,
                                  fFamily: "poppinsbold",
                                ),
                                hSpacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "https://ww1.freelogovectors.net/wp-content/uploads/2023/03/facebook-logo-new-2019-freelogovectors.net_.png?lossy=1&ssl=1",
                                      scale: 12,
                                    ),
                                    wSpacer(mWidth: media.size.width*.056),
                                    Image.network(
                                      "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                                      scale: 9,
                                    ),
                                    wSpacer(mWidth: media.size.width*.056),
                                    Image.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/512px-Logo_of_Twitter.svg.png?20220821125553",
                                      scale: 12,
                                    ),
                                  ],
                                ),


                              ],
                            ),


                          ],
                        ),


                      ],
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
