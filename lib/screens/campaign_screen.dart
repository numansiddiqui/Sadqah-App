// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_import

import 'package:fluttbase/screens/home_screen.dart';
import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/screens/create_campaign_screen.dart';
import 'package:fluttbase/widgets/features/CampaignScreen/Category_Button.dart';
import 'package:fluttbase/widgets/features/CampaignScreen/campaign_card.dart';
import 'package:fluttbase/widgets/features/homeScreen/featured_caampaign_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CampaignScreen extends StatelessWidget {
  const CampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor.withOpacity(1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.backgroundColor.withOpacity(1),
        title: Text(
          "Campaigns",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      // Column for categories rows and campaign card columns
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Category_Button(
                    image: Image.asset('assets/icons/education-icon.png'),
                    mainText: "Education",
                  ),
                  Category_Button(
                    image: Image.asset('assets/icons/childcare-icon.png'),
                    mainText: "Children",
                  ),
                  Category_Button(
                    image: Image.asset('assets/icons/health-care-icon.png'),
                    mainText: "Healthcare",
                  ),
                  Category_Button(
                    image: Image.asset('assets/icons/women-icon.png'),
                    mainText: "Women",
                  )
                ],
              ),
              SizedBox(height: 16),
              CampaignCard(),
              SizedBox(
                height: 12,
              ),
              CampaignCard()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () => {
          Navigator.push(
              context,
              PageTransition(
                  child: CreateCampaignScreen(),
                  type: PageTransitionType.bottomToTop))
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Constants.primaryColor.withOpacity(1),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
