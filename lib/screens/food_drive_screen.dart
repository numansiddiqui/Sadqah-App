// ignore_for_file: prefer_const_constructors

import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/widgets/global/CustomList.dart';
import 'package:flutter/material.dart';

class FoodDriveScreen extends StatelessWidget {
  const FoodDriveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
            child: Stack(
          children: [
            Container(
              child: Image.asset('assets/images/food-drive-bg.png'),
              width: MediaQuery.sizeOf(context).width * 1,
              height: MediaQuery.sizeOf(context).height * 0.37,
            ),
            Positioned(
                top: 24,
                left: 16,
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Constants.backgroundColor.withOpacity(0.3),
                  ),
                  child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                ))
          ],
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Food Drive",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Constants.primaryColor.withOpacity(1),
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Feed poor homeless people through our food drive program.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Constants.primaryColor.withOpacity(1),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              CustomList(
                  image:
                      Image.asset('assets/icons/material-symbols_update.png'),
                  text: "Check our availability in your desired location"),
              SizedBox(
                height: 24,
              ),
              CustomList(
                  image:
                      Image.asset('assets/icons/mdi_information-outline.png'),
                  text: "Select from our pre curated packages."),
              SizedBox(
                height: 24,
              ),
              CustomList(
                  image:
                      Image.asset('assets/icons/material-symbols_update.png'),
                  text:
                      "We will send you the bill of total expense as a proof of work")
              // children:
            ],
          ),
        ),
      ],
    ));
  }
}
