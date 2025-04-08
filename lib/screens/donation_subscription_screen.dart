import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/widgets/global/CustomList.dart';
import 'package:flutter/material.dart';

class DonationSubscriptionScreen extends StatelessWidget {
  const DonationSubscriptionScreen({super.key});

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
              width: MediaQuery.sizeOf(context).width * 1,
              height: MediaQuery.sizeOf(context).height * 0.37,
              child: Image.asset('assets/images/background-img-donations.png'),
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
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                ))
          ],
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subscribe Monthly Donation",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Constants.primaryColor.withOpacity(1),
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "Too busy to make donation ? Use our Subscription Model. ",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Constants.primaryColor.withOpacity(1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomList(
                  image:
                      Image.asset('assets/icons/material-symbols_update.png'),
                  text: "Select an amount of your choice and subscribe"),
              const SizedBox(
                height: 24,
              ),
              CustomList(
                  image:
                      Image.asset('assets/icons/material-symbols_update.png'),
                  text: "Get an update on where your donation was used"),
              const SizedBox(
                height: 24,
              ),
              CustomList(
                  image:
                      Image.asset('assets/icons/material-symbols_update.png'),
                  text:
                      "After 30 days Automatic donation is made from your bank account")
              // children:
            ],
          ),
        ),
      ],
    ));
  }
}
