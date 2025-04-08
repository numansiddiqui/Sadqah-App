import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomList extends StatelessWidget {
  final Image image;
  final String text;
  const CustomList({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 2),
          child: image,
          width: 24,
          height: 24,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 12,
                color: Constants.blackColor.withOpacity(0.5),
                fontFamily: 'Poppins'),
          ),
        )
      ],
    );
  }
}
