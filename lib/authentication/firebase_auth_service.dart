

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/notif.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signUpWithEmailAndPassword(String email, String password) async {
    print(email);
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint("--------Error Firebase Sign up");
      debugPrint(e.email);
      if (e.code == 'email-already-in-use') {
        showToast("The email is already in use.");
      }
      else if (e.code == 'invalid-email') {
        showToast("The email address is invalid");
      }
      else {
        showToast("An error occurred : ${e.code}");
      }
    }
    return false;
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword( email: email, password: password);


      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showToast("Invalid email");
      }
      else if (e.code == 'user-disabled') {
        showToast("The user is disabled");
      }
      else if (e.code == 'user-not-found') {
        showToast("User not found");
      }
      else if (e.code == 'wrong-password') {
        showToast("Wrong Password");
      }
      else {
        showToast("An error occurred : ${e.code}");
      }
    }
    return false;
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showToast("Password reset link sent!, Check you email!");
      return true;
    } on FirebaseAuthException catch (e) {
      showToast(e.message.toString());
    }
    return false;
  }

  signInWithGoogle() async {
    //begin sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtaining auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create new credential
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken
    );

    return await _auth.signInWithCredential(credential);
  }

  void signOut() async{
    try{
      await _auth.signOut();
      if( await GoogleSignIn().isSignedIn()){
        await GoogleSignIn().signOut();
      }

      showToast("Logged out successfully");
    }
    on FirebaseAuthException catch (e){
      showToast(e.message.toString());
    }
  }
}