import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInWithGoogle extends StatefulWidget {
  const SignInWithGoogle({super.key});

  @override
  State<SignInWithGoogle> createState() => _SignInWithGoogleState();
}

class _SignInWithGoogleState extends State<SignInWithGoogle> {
  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print("name is ${user.user?.displayName}");
    print("email is ${user.user?.email}");
    print("phonenumber is ${user.user?.phoneNumber}");
    print("photo is ${user.user?.photoURL}");
    print("uid is ${user.user?.uid}");
     print("photo is ${user.user?.isAnonymous}");
      print("photo is ${user.user?.emailVerified}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 120,
          width: 120,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: IconButton(
            onPressed: () {
              signInWithGoogle();
            },
            icon: const Icon(
              Icons.g_mobiledata,
              size: 100,
            ),
          ),
        ),
      ),
    );
  }
}
