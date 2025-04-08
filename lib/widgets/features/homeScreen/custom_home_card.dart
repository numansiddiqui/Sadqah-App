import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CustomHomeCard extends StatelessWidget {
  final void Function() onTap;
  final String mainText;
  final String subText;
  final Image image;
  const CustomHomeCard(
      {super.key,
      required this.onTap,
      required this.mainText,
      required this.subText,
      required this.image});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * .45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
              width: 0.5, color: Constants.greyColor.withOpacity(0.5)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      width: 0.5, color: Constants.primaryColor.withOpacity(1)),
                  // color: Constants.greyShade.withOpacity(0.2),
                ),
                child: image,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                mainText,
                style: TextStyle(
                    color: Constants.primaryColor.withOpacity(1),
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                subText,
                style: TextStyle(
                    color: Constants.blackColor.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
