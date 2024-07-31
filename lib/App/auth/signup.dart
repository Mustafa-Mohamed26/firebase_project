// ignore_for_file: avoid_print, use_build_context_synchronously, body_might_complete_normally_nullable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/components/Customlogoauth.dart';
import 'package:firebase_project/components/custom_button_auth.dart';
import 'package:firebase_project/components/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
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
                    "Sign Up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 10,
                  ),
                  const Text(
                    "SignUp To continue using the app",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    height: 20,
                  ),
                  const Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: "Enter  Your Username here",
                    myController: username,
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
              title: "Sign Up",
              onPressed: () async {
                if (formState.currentState!.validate()) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                    FirebaseAuth.instance.currentUser!.sendEmailVerification();
                    Navigator.of(context).pushReplacementNamed('login');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'The password provided is too weak.',
                      ).show();
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'The account already exists for that email.',
                      ).show();
                    }
                  } catch (e) {
                    print(e);
                  }
                }
              },
            ),
            Container(
              height: 20,
            ),

            Container(
              height: 20,
            ),
            //Text("Don't have an account ? Register",textAlign: TextAlign.center,),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('login');
              },
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Have an Account? ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: "login",
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
