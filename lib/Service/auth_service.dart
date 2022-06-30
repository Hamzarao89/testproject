import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syntech1/Service/database_service.dart';
import 'package:syntech1/utils/utils.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  //current user
  Future<User> getCurrentUser() async {
    return await auth.currentUser!;
  }

  //login with email
  Future<void> signin({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  //signout with email
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      Utils.toastMessage(e.toString()); // Displaying the error message
    }
  }

  //signup with email
  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required String username,
      required String phone}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Map<String, dynamic> userInfo = {
        "username": username,
        "phone": phone,
        "email": email,
        "password": password,
      };
      if (userCredential != null) {
        DatabaseService().addUser(auth.currentUser!.uid, userInfo);
      }
    } on FirebaseAuthException catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  // sign in with google

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  //google sign out
  Future<void> googleSignOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }
  //facebook login

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
    } on FirebaseAuthException catch (e) {
      Utils.toastMessage(e.toString());
    }
  }
}
