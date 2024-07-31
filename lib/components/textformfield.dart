import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  const CustomTextFormField({super.key, required this.hintText, required this.myController, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: myController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 249, 248, 248),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 249, 248, 248),
          ),
        ),
      ),
    );
  }
}
