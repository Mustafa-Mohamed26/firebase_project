// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/components/Customlogoauth.dart';
import 'package:firebase_project/components/custom_button_auth.dart';
import 'package:firebase_project/components/textFormField.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                  ),
                  const CustomLogoAuth(),
                  Container(
                    height: 20,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 10,
                  ),
                  const Text(
                    "Login To continue using the app",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    height: 20,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: "Enter  Your Email here",
                    myController: email,
                    validator: (val) {
                      if (val == "") {
                        return "Can't be empty";
                      }
                    },
                  ),
                  Container(
                    height: 10,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: "Enter your password here",
                    myController: password,
                    validator: (val) {
                      if (val == "") {
                        return "Can't be empty";
                      }
                    },
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: const Text(
                      "Forgot Password ?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonAuth(
              title: "Login",
              onPressed: () async {
                if (formState.currentState!.validate()) {
                  try {
                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                    Navigator.of(context).pushReplacementNamed("homepage");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print(
                          '====================================No user found for that email.');
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'No user found for that email.',
                      ).show();
                    } else if (e.code == 'wrong-password') {
                      print(
                          '====================================Wrong password provided for that user.');
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'Wrong password provided for that user.',
                      ).show();
                    }
                  }
                } else {
                  print("Not valid");
                }
              },
            ),
            Container(
              height: 20,
            ),
            const Text(
              "OR Login",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 20,
            ),
            MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              textColor: Colors.blue,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login With Google   "),
                  Image.asset(
                    "images/google.png",
                    width: 35,
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
            ),
            //Text("Don't have an account ? Register",textAlign: TextAlign.center,),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('signUp');
              },
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account ? ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
