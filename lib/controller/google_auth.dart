import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes/pages/ui/home.dart';

GoogleSignIn googleSignIn = GoogleSignIn();

final FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection("users");

Future<bool> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      final UserCredential authResult =
          await auth.signInWithCredential(credential);
      final User user = authResult.user;
      //uerdata
      var userData = {
        "user": googleSignInAccount.displayName,
        "provider": "google",
        "provider": googleSignInAccount.email,
        "email": googleSignInAccount.email,
        "photoUrl": googleSignInAccount.photoUrl,
      };

      //uid
      users.doc(user.uid).get().then((doc) {
        if (doc.exists) {
          // olduser
          doc.reference.update(userData);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomPage()));
        } else {
          users.doc(user.uid).set(userData);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomPage()));
        }
      });
    }
  } catch (PlatformException) {}
}
