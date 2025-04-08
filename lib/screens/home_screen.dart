import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttbase/screens/campaign_detail.dart';
import 'package:fluttbase/services/auth/auth_service.dart';
import 'package:fluttbase/services/provider/screenIndexProvider.dart';
import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/screens/donation_subscription_screen.dart';
import 'package:fluttbase/screens/food_drive_screen.dart';
import 'package:fluttbase/screens/profile_screen.dart';
import 'package:fluttbase/widgets/features/homeScreen/custom_home_card.dart';
import 'package:fluttbase/widgets/features/homeScreen/featured_caampaign_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = AuthService();
  int bottomNavigatorKey = 0;
  int _currentpage = 0;
  @override
  Widget build(BuildContext context) {
    final screenindexprovider = Provider.of<screenIndexProvider>(context);

    // Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 12,
                      color: Constants.blackColor.withOpacity(0.8),
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Numan",
                  style: TextStyle(
                      fontSize: 16,
                      color: Constants.blackColor.withOpacity(0.8),
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        uid: _auth.getCurrentUserId(),
                      ),
                    ));
              },
              child: Container(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: Image.asset(
                  'assets/images/Avatar1.png',
                  height: 32,
                  width: 32,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 180,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(milliseconds: 3000),
                  onPageChanged: (value, _) => {
                    setState(() {
                      _currentpage = value;
                    })
                  },
                ),
                items: const [
                  BannerImages(imgPath: 'assets/images/banner1.png'),
                  BannerImages(imgPath: 'assets/images/banner2.png'),
                  BannerImages(imgPath: 'assets/images/banner3.png'),
                ],
              ),
              buildCarouselIndicator(),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomHomeCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DonationSubscriptionScreen()));
                        },
                        mainText: "Subscribe Donation",
                        subText: "Donate Monthly a fixed amount",
                        image: Image.asset(
                          'assets/icons/Vector.png',
                          height: 24,
                          width: 24,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomHomeCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                child: const FoodDriveScreen(),
                                type: PageTransitionType.fade,
                              ));
                        },
                        mainText: "Food Drive",
                        subText: "Feed hungry ones through food drive program",
                        image: Image.asset(
                          'assets/icons/pajamas_food.png',
                          height: 24,
                          width: 24,
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Campaigns",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Constants.primaryColor.withOpacity(1)),
                        ),
                        GestureDetector(
                            onTap: () {
                              screenindexprovider.updateScreenIndex(1);
                            },
                            child: Row(
                              children: [
                                Text("View All",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Constants.primaryColor
                                            .withOpacity(1))),
                                const SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: Constants.primaryColor.withOpacity(1),
                                )
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CampaignDetail(),
                            ),
                          );
                        },
                        child: FeaturedCampaignCard(),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      FeaturedCampaignCard(),
                      SizedBox(
                        width: 8,
                      ),
                      FeaturedCampaignCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.only(left: 5),
            height: 4,
            width: i == _currentpage ? 30 : 8,
            decoration: BoxDecoration(
                color: i == _currentpage
                    ? Constants.primaryColor.withOpacity(1)
                    : Constants.greyShade.withOpacity(1),
                borderRadius: BorderRadius.circular(8.0)),
          )
      ],
    );
  }
}

class BannerImages extends StatelessWidget {
  final String imgPath;
  const BannerImages({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        // height: 120,
        // width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Image.asset(
            height: 180,
            imgPath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
