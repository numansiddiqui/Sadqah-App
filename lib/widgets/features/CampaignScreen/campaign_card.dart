import 'package:fluttbase/utils/constants.dart';
import 'package:flutter/material.dart';

class CampaignCard extends StatelessWidget {
  const CampaignCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Constants.blackColor.withOpacity(1),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '20000',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Constants.primaryColor.withOpacity(1),
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' by Raised of',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Constants.blackColor.withOpacity(1)),
                  ),
                  const TextSpan(
                    text: ' Rs 400,000',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: LinearProgressIndicator(
                value: 200000 / 400000,
                backgroundColor: Constants.greyColor.withOpacity(0.5),
                valueColor: AlwaysStoppedAnimation<Color>(
                    Constants.primaryColor.withOpacity(1)),
                minHeight: 10.0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Help my son Joe to fight brain cancer and tumor",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Constants.blackColor.withOpacity(1)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Avatar1.png',
                  height: 32,
                  width: 32,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "John Doe",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Constants.blackColor.withOpacity(1)),
                ),
                const Spacer(),
                Text(
                  "14 days left",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.red.withOpacity(0.8)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
