import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syntech1/Service/auth_service.dart';
import 'package:syntech1/View/Home_View.dart';
import 'package:syntech1/View/SignUp_view.dart';
import 'package:syntech1/res/button.dart';
import 'package:syntech1/res/color.dart';
import 'package:syntech1/res/customTextForm.dart';
import 'package:syntech1/utils/rich_text.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Auth auth = Auth();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height * 0.08,
            ),
            Container(
              height: height * 0.60,
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.origionalwhiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blueColor),
                      ),
                    ),
                    CustomTextField(
                        validator: () {},
                        // validator: (value) {
                        //   if (value == null) {
                        //     Utils.toastMessage("Please Enter the Email");
                        //   } else if (value > 6) {
                        //     Utils.toastMessage("Please Enter the Proper Email");
                        //   }
                        // },
                        inputType: TextInputType.emailAddress,
                        title: "E-mail",
                        controller: _emailController,
                        icon: Icons.mail),
                    CustomTextField(
                        validator: () {},
                        // validator: (value) {
                        //   if (value == null) {
                        //     Utils.toastMessage("Please Enter the Password");
                        //   } else if (value > 8) {
                        //     Utils.toastMessage(
                        //         "Please Enter the 8 digit Password");
                        //   }
                        // },
                        obsure: true,
                        inputType: TextInputType.text,
                        title: "Password",
                        controller: _passwordController,
                        icon: Icons.key),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("Forget Password ?"),
                      ],
                    ),
                    RoundButton(
                      title: "Sign In ",
                      onPress: () {
                        auth.signin(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim());

                        //Routing for Now
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      icon: Icons.forward,
                    ),
                    const Text("Or Sign In with"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          //Facebook login
                          onTap: () async {
                            await auth.signInWithFacebook(context);
                          },
                          child: SizedBox(
                            height: height * 0.1,
                            width: width * 0.1,
                            child: Image.asset("images/facebook_logo.png"),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        InkWell(
                          // google login button
                          onTap: () async {
                            await auth.signInWithGoogle();

                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) => HomeScreen())));
                          },
                          child: SizedBox(
                            height: height * 0.1,
                            width: width * 0.1,
                            child: Image.asset("images/gmail_logo.png"),
                          ),
                        ),
                      ],
                    ),
                    CustomRichText(
                      initialTextClr: AppColors.blackColor,
                      endTextColor: AppColors.blackColor,
                      initialText: "Don\'t have an account ?",
                      endText: "Sign Up",
                      onPress: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.2,
              width: width * 0.8,
              child: Image.asset(
                "images/Sign.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomRichText(
              initialTextClr: AppColors.origionalwhiteColor,
              endTextColor: AppColors.origionalwhiteColor,
              initialText: " You Agree with",
              endText: "Terms \& Conditions.",
              onPress: () {},
            )
          ],
        ),
      ),
    );
  }
}
