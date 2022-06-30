import 'package:flutter/material.dart';
import 'package:syntech1/Service/auth_service.dart';
import 'package:syntech1/View/SignIn_View.dart';
import 'package:syntech1/res/button.dart';
import 'package:syntech1/res/color.dart';
import 'package:syntech1/res/customTextForm.dart';
import 'package:syntech1/utils/rich_text.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Auth auth = Auth();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              Container(
                height: height * 0.60,
                width: width * 0.90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.origionalwhiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blueColor),
                        ),
                      ),
                      CustomTextField(
                          validator: () {},
                          inputType: TextInputType.name,
                          title: "Username",
                          controller: _usernameController,
                          icon: Icons.person),
                      CustomTextField(
                          validator: () {},
                          inputType: TextInputType.phone,
                          title: "Number",
                          controller: _phoneController,
                          icon: Icons.phone),
                      CustomTextField(
                          // onChanged: (email) {
                          //   email = _emailController.toString().trim();
                          // },
                          validator: () {},
                          inputType: TextInputType.emailAddress,
                          title: "E-mail",
                          controller: _emailController,
                          icon: Icons.mail),
                      CustomTextField(
                          //  onChanged: (password) {
                          //     password = _passwordController.toString().trim();
                          //   },
                          validator: () {},
                          obsure: true,
                          inputType: TextInputType.text,
                          title: "Password",
                          controller: _passwordController,
                          icon: Icons.key),
                      CustomTextField(
                          validator: () {},
                          obsure: true,
                          inputType: TextInputType.text,
                          title: "Confirm Password",
                          controller: _confirmPasswordController,
                          icon: Icons.key),
                      RoundButton(
                        title: "Sign Up ",
                        onPress: () async {
                          await auth.signUpWithEmail(
                              email: _emailController.text,
                              password: _passwordController.text,
                              username: _usernameController.text,
                              phone: _phoneController.text);

                          // Routing for now
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        },
                        icon: Icons.forward,
                      ),
                      CustomRichText(
                        initialTextClr: AppColors.blackColor,
                        endTextColor: AppColors.blackColor,
                        initialText: "Already have an account ?",
                        endText: "Sign In",
                        onPress: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
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
                  height: height * 0.20,
                  width: width * 0.8,
                  child: Image.asset(
                    "images/Sign.png",
                    fit: BoxFit.fill,
                  )),
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
        ],
      ),
    );
  }
}
