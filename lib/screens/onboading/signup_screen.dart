import 'package:expense_new/customs/custom_Elevated_Button.dart';
import 'package:expense_new/customs/custom_text.dart';
import 'package:expense_new/customs/custom_textfield.dart';
import 'package:expense_new/database_provider/app_database.dart';
import 'package:expense_new/models/user_model.dart';
import 'package:expense_new/screens/onboading/login_screen.dart';
import 'package:expense_new/ui_helper.dart';
import 'package:flutter/material.dart';

import '../../customs/custom_container.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var orientation;
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.blueAccent,

      body: OrientationBuilder(
        builder: (context, orientation) {
          if(orientation == Orientation.portrait){
            return Form(
              key: portraitKey,
              child: Container(
                decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA1L3JtMzczYmF0Y2gxNS1iZy0xMS14LWItam9iMTYzMS5qcGc.jpg"),fit: BoxFit.cover
                  ),
                ),
                child: Center(

                  child: CustomContainer(
                    cHeight: media.size.height*.8,
                    cWidth:media.size.width*.9  ,
                    cColor: AppColors.begniColor.withOpacity(.3),
                    cRadius: BorderRadius.circular(20),

                    borderSideColor: AppColors.whiteColor,
                    borderSideWidth: 1,
                    mChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(fText: "Create Account",fSize: 35,fFamily: "poppinsbold",fColor: AppColors.whiteColor),
                        SizedBox(
                            height: media.size.height*.056,
                            width: media.size.width*.75,
                            child: CustomTextField(hintTxt: "Username", validate: (value) {  },)),
                        SizedBox(
                            height: media.size.height*.056,
                            width: media.size.width*.79,
                            child: CustomTextField(hintTxt: "Email address",
                              validate: (value ) {
                                if(value == "" || !value!.contains("@")){
                                  return "Please enter a valid email address";

                                }else{
                                  return null;
                                }


                              },)),
                        SizedBox(
                          height: media.size.height*.056,
                          width: media.size.width*.79,
                          child: CustomTextField(
                            hintTxt: "Password",
                            suffIcon: Icons.visibility_off_outlined,
                            validate: (value) {
                              if(value == "" || value!.length < 5){
                                return "Please enter a valid Password(Password must be 6 Characters)";

                              }else{
                                return null;
                              }
                            },),

                        ),
                        SizedBox(
                            height: media.size.height*.056,
                            width: media.size.width*.75,
                            child: CustomTextField(hintTxt: "Confirm Password",suffIcon: Icons.visibility_off_outlined,
                              validate: (value ) {
                                if(value == "" || value!.length < 5){
                                  return "Please enter a valid Password(Password must be 6 Characters)";

                                }else{
                                  return null;
                                }
                              },)),
                        SizedBox(
                          height: media.size.height*.04,
                          width: media.size.width*.33,
                          child: CustomElevatedButton(
                            onTap: () async {
                              if (portraitKey.currentState!.validate()) {
                                var check = await Appdatabase().createUser(
                                    UserModel(
                                        email: emailController.text,
                                        password: passwordController.text));

                                if (check) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ));
                                } else {
                                  //show error
                                }
                              }
                            },
                            mChild: CustomText(fText: "Sign up",fFamily: "poppinsbold",fColor: AppColors.whiteColor,fSize: 20,),
                            ButtonRadius: BorderRadius.circular(15),
                            ButtonColor: AppColors.buttonColor,
                          ),
                        ),
                        CustomText(fText: "continue with",fColor: AppColors.hintextColor,fFamily: "poppinsbold",),
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
                            CustomText(fText: "Already have account ?",fColor: AppColors.hintextColor,fFamily: "poppinsbold",),
                            wSpacer(mWidth: media.size.width*.02),
                            InkWell(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                },
                                child: CustomText(fText: "Login",fColor: AppColors.hintextColor,fFamily: "poppinsbold",underText: TextDecoration.underline,fSize: 17,)),

                          ],
                        ),

                      ],
                    ),
                  ),

                ),
              ),
            );
          }else{
            return Form(
              key: landscapeKey,
              child: Container(
                decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA1L3JtMzczYmF0Y2gxNS1iZy0xMS14LWItam9iMTYzMS5qcGc.jpg"),fit: BoxFit.cover
                  ),
                ),
                child: Center(

                  child: CustomContainer(
                    cHeight: media.size.height*.8,
                    cWidth:media.size.width*.9  ,
                    cColor: AppColors.begniColor.withOpacity(.3),
                    cRadius: BorderRadius.circular(20),

                    borderSideColor: AppColors.whiteColor,
                    borderSideWidth: 1,
                    mChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(fText: "Create Account",fSize: 30,fFamily: "poppinsbold",fColor: AppColors.whiteColor),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: media.size.height*.12,
                                width: media.size.width*.4,
                                child: CustomTextField(hintTxt: "Username", validate: (value) {  },)),
                            wSpacer(mWidth: media.size.width*.03),
                            SizedBox(
                                height: media.size.height*.12,
                                width: media.size.width*.4,
                                child: CustomTextField(hintTxt: "Email address",
                                  validate: (value ) {
                                    if(value == "" || !value!.contains("@")){
                                      return "Please enter a valid email address";

                                    }else{
                                      return null;
                                    }


                                  },)),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(
                              height: media.size.height*.12,
                              width: media.size.width*.4,
                              child: CustomTextField(
                                hintTxt: "Password",
                                suffIcon: Icons.visibility_off_outlined,
                                validate: (value) {
                                  if(value == "" || value!.length < 5){
                                    return "Please enter a valid Password(Password must be 6 Characters)";

                                  }else{
                                    return null;
                                  }
                                },),

                            ),
                            wSpacer(mWidth: media.size.width*.03),
                            SizedBox(
                                height: media.size.height*.12,
                                width: media.size.width*.4,
                                child: CustomTextField(hintTxt: "Confirm Password",suffIcon: Icons.visibility_off_outlined,
                                  validate: (value ) {
                                    if(value == "" || value!.length < 5){
                                      return "Please enter a valid Password(Password must be 6 Characters)";

                                    }else{
                                      return null;
                                    }
                                  },)),
                          ],

                        ),
                        hSpacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: media.size.height*.1,
                                  width: media.size.width*.33,
                                  child: CustomElevatedButton(
                                    onTap: () async {
                                      if (landscapeKey.currentState!.validate()) {
                                        var check = await Appdatabase().createUser(
                                            UserModel(
                                                email: emailController.text,
                                                password: passwordController.text));

                                        if (check) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LoginScreen(),
                                              ));
                                        } else {
                                          //show error
                                        }
                                      }
                                    },
                                    mChild: CustomText(fText: "Sign up",fFamily: "poppinsbold",fColor: AppColors.whiteColor,fSize: 20,),
                                    ButtonRadius: BorderRadius.circular(15),
                                    ButtonColor: AppColors.buttonColor,
                                  ),
                                ),
                                hSpacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(fText: "Already have account ?",fColor: AppColors.hintextColor,fFamily: "poppinsbold",),
                                    wSpacer(mWidth: media.size.width*.01),
                                    InkWell(
                                        onTap: (){
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                        },
                                        child: CustomText(fText: "Login",fColor: AppColors.hintextColor,fFamily: "poppinsbold",underText: TextDecoration.underline,fSize: 17,)),

                                  ],
                                ),

                              ],
                            ),
                            wSpacer(mWidth: media.size.width*.1),
                            Column(
                              children: [
                                CustomText(fText: "continue with",fColor: AppColors.hintextColor,fFamily: "poppinsbold",),
                                hSpacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network("https://ww1.freelogovectors.net/wp-content/uploads/2023/03/facebook-logo-new-2019-freelogovectors.net_.png?lossy=1&ssl=1",scale: 12,),
                                    wSpacer(mWidth: media.size.width*.056),
                                    Image.network("https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",scale: 9,),
                                    wSpacer(mWidth: media.size.width*.056),
                                    Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/512px-Logo_of_Twitter.svg.png?20220821125553",scale: 12,),
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
