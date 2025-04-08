// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/widgets/global/Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CampaignDetail extends StatelessWidget {
  const CampaignDetail({super.key});

  @override
  Widget build(BuildContext context) {
    List RandomImages = [
      'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
      'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
      'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s'
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset('assets/images/Frame 18.png'),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Help my three year old son Joe to fight brain cancer',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Constants.blackColor.withOpacity(1),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '20000',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Constants.primaryColor.withOpacity(1),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' by Raised of',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Constants.blackColor.withOpacity(1)),
                        ),
                        TextSpan(
                          text: ' Rs 400,000',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
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
              const SizedBox(height: 12.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < RandomImages.length; i++)
                    Container(
                      // margin: EdgeInsets.symmetric(vertical: 0),
                      child: Align(
                          widthFactor: 0.8,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundImage: NetworkImage(
                              RandomImages[i],
                            ),
                          )),
                    ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle donor list tap
                    },
                    child: Text(
                      'Donors List',
                      style: TextStyle(
                        color: Constants.blackColor.withOpacity(1),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '14 days Left',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelStyle: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Constants.primaryColor.withOpacity(1)),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Constants.primaryColor.withOpacity(1),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w600),
                      tabs: [
                        Tab(
                          text: "Description",
                        ),
                        Tab(
                          text: "Documents",
                        ),
                        Tab(
                          text: "Bank Details",
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height *
                          .4, // Adjust height as needed
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: .0, vertical: 12.0),
                            child: Container(
                              color: Constants.greyColor.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet consectetur. Commodo massa bibendum lorem tincidunt fames ultrices. Ultricies nunc congue quam nunc enim sit. Dictum facilisi amet dictum lectus dui turpis. Euismod augue egestas faucibus ridiculus.Lorem ipsum dolor sit amet consectetur. Commodo massa bibendum lorem tincidunt fames ultrices. Ultricies nunc congue quam nunc enim sit. Dictum facilisi amet dictum lectus dui turpis. Euismod augue egestas faucibus ridiculus.',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      height: 1.5,
                                      color:
                                          Constants.blackColor.withOpacity(1),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          const Center(child: Text('Documents Tab Content')),
                          const Center(child: Text('Bank Details Tab Content')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Constants.greyColor.withOpacity(1), width: 1))),
        height: 70,
        child: Button(
          text: "Donate Now",
          onTap: () {},
        ),
      ),
    );
  }
}
