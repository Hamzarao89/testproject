import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syntech1/Service/auth_service.dart';
import 'package:syntech1/View/SignUp_view.dart';
import 'package:syntech1/res/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundButton(
              icon: Icons.logout_outlined,
              title: "Sign Out",
              onPress: () async {
                await auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              }),
          RoundButton(
              icon: Icons.logout_outlined,
              title: "Sign Out",
              onPress: () async {
                await auth.googleSignOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              })
        ],
      )),
    );
  }
}
