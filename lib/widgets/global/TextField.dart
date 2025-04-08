// ignore_for_file: prefer_const_constructors

import 'package:fluttbase/utils/constants.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final int? maxLines;
  final bool obscureText;
  final IconButton? formIcon;
  final TextEditingController controller;
  final TextInputType? textInputType;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      required this.labelText,
      this.formIcon,
      this.maxLines,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Text(
          labelText,
          style: TextStyle(
            fontSize: 12,
            color: Constants.blackColor.withOpacity(1),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          controller: controller,
          cursorColor: Constants.primaryColor.withOpacity(1),
          decoration: InputDecoration(
              suffixIcon: formIcon,
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Constants.greyColor.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(8.0)),
              contentPadding:
                  EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Constants.greyColor.withOpacity(1),
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Constants.primaryColor.withOpacity(1),
                  ))),
          obscureText: obscureText,
        ),
      ],
    );
  }
}
