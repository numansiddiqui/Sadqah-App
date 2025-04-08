// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:fluttbase/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Category_Button extends StatelessWidget {
  final String mainText;
  final Image image;
  const Category_Button({
    super.key,
    required this.mainText,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          // card wrapper
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white.withOpacity(1),
            ),
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: image,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Constants.greyColor.withOpacity(0.2),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 61,
                  child: Center(
                    child: Text(
                      mainText,
                      style: TextStyle(
                          fontSize: 10,
                          color: Constants.primaryColor.withOpacity(1),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          )
          // icon wrapper
        ],
      ),
    );
  }
}
