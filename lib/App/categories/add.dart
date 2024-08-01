// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/components/custom_button_auth.dart';
import 'package:firebase_project/components/custom_text_field_add.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');

  addCategory() async {
    if (formState.currentState!.validate()) {
      try {
        DocumentReference response = await categories.add({'name': name.text});
        Navigator.of(context).pushReplacementNamed("homepage");
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Category"),
      ),
      body: Form(
        key: formState,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: CustomTextFormFieldAdd(
                hintText: "Enter Name",
                myController: name,
                validator: (val) {
                  if (val == "") {
                    return "Can't be empty";
                  }
                  return null;
                },
              ),
            ),
            CustomButtonAuth(
              title: "add",
              onPressed: () {
                addCategory();
              },
            ),
          ],
        ),
      ),
    );
  }
}
