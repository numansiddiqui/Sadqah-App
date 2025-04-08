import 'package:fluttbase/utils/constants.dart';
import 'package:flutter/material.dart';

class FeaturedCampaignCard extends StatelessWidget {
  const FeaturedCampaignCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 0.5, color: Constants.greyColor.withOpacity(0.5))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/campaign-poster.png',
              width: MediaQuery.of(context).size.width * 0.45,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "2000 Raised of 40000",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Constants.blackColor.withOpacity(1)),
            ),
            SizedBox(
              height: 8,
            ),
            Stack(
              children: [
                Container(
                  height: 6,
                  // width: MediaQuery.of(context).size.width * 0.5,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Constants.primaryColor.withOpacity(1),
                  ),
                ),
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Constants.primaryColor.withOpacity(0.3),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Help my son Joe to fight brain cancer",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Constants.blackColor.withOpacity(1)),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "14 days left",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.red.withOpacity(0.8)),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // padding: EdgeInsets.only(top: 0, right: 6),
                  child: Image.asset(
                    'assets/images/Avatar1.png',
                    height: 24,
                    width: 24,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "John Doe",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Constants.blackColor.withOpacity(1)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
