import 'package:flutter/material.dart';

class MyDescriptionField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final int? maxLines;
  final IconButton? formIcon;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool readOnly;

  const MyDescriptionField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.labelText,
      this.formIcon,
      this.maxLines,
      this.textInputType, required this.readOnly});

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
            color: Color(0x5d5d5d).withOpacity(1),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          readOnly: readOnly,
          cursorColor: Color(0x005546).withOpacity(1),
          decoration: InputDecoration(
              suffixIcon: formIcon,
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(0x5d5d5d).withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(8.0)),
              contentPadding:
                  EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Color(0x5d5d5d).withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Color(0x005546).withOpacity(1),
                  ))),
          controller: controller,
          maxLines: maxLines,
          keyboardType: textInputType,
        ),
      ],
    );
  }
}
