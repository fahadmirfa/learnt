import 'package:flutter/material.dart';

import '../constants.dart';



class MyTextField extends StatelessWidget {
  MyTextField({
    required this.hintText,
    required this.inputType,
    this.controller,
    this.validator,
  });

  final String hintText;
  final TextInputType inputType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        style: kBodyText.copyWith(color: Colors.white),
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: hintText,
          hintStyle: kBodyText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
