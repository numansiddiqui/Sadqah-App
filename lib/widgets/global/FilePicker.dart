// ignore_for_file: prefer_const_constructors
import 'package:fluttbase/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class FilePickerWidget extends StatelessWidget {
  final String text;
  void Function()? onTap;
  FilePickerWidget({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(8),
          color: Constants.primaryColor.withOpacity(1),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.image,
                  color: Constants.primaryColor.withOpacity(1),
                  size: 24,
                ),
                Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Constants.primaryColor.withOpacity(1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
