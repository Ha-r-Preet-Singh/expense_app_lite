import 'dart:async';

import 'package:expense_new/customs/custom_text.dart';
import 'package:expense_new/screens/home/home_screen.dart';
import 'package:expense_new/screens/onboading/login_screen.dart';
import 'package:expense_new/screens/onboading/signup_screen.dart';
import 'package:expense_new/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LOGIN_KEY ="LoggedIn";
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 4), () async{
      var prefs =await SharedPreferences.getInstance();

      var isLogin = prefs.getBool(LOGIN_KEY);

      Widget naviageteToPage = SignUpScreen();


      if(isLogin != null){
        if(isLogin){
          //is True
          naviageteToPage = HomeScreen();


        }else{
          naviageteToPage = SignUpScreen();

        }
      }else{
        naviageteToPage = SignUpScreen();

      }


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => naviageteToPage) );




    });
  }

  var orientation;
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if(orientation == Orientation.portrait){
            return Form(
              key: portraitKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(

                    children: [

                      CustomText(fText: "Expenso",fColor: AppColors.onboardingColor,fSize: 65,fFamily: "poppinsbold",),
                      Lottie.asset("assets/lottie/animation_llxfehpo.json"),
                      Lottie.asset("assets/lottie/animation_llxg2tab.json"),
                    ],
                  ),
                ),
              ),
            );
          }else{
            return Form(
              key: landscapeKey,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      CustomText(fText: "Expenso",fColor: AppColors.onboardingColor,fSize: 65,fFamily: "poppinsbold",),
                      Lottie.asset("assets/lottie/animation_llxfehpo.json"),

                    ],
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
