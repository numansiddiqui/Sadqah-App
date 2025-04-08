// ignore_for_file: prefer_const_constructors, unused_import

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fluttbase/screens/dashboard_screen.dart';
import 'package:fluttbase/services/provider/screenIndexProvider.dart';
import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/screens/campaign_screen.dart';
import 'package:fluttbase/screens/food_drive_screen.dart';
import 'package:fluttbase/screens/home_screen.dart';
import 'package:fluttbase/screens/notification.dart';
import 'package:fluttbase/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  List<Widget> pages = const [
    HomeScreen(),
    CampaignScreen(),
    DashboardScreen(),
    // ProfleScreen(),
    NotificationScreen(),
  ];

  List<IconData> icons = const [
    Icons.home_outlined,
    Icons.dashboard_outlined,
    Icons.campaign_outlined,
    Icons.notifications,
  ];

  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = Provider.of<screenIndexProvider>(context);
    int currentScreenIndex = _screenindexprovider.fetchCurrentScreenIndex;
    return Scaffold(
      body: IndexedStack(
        index: currentScreenIndex,
        children: pages,
      ),
      //
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Constants.greyShade.withOpacity(1),
          selectedItemColor: Constants.primaryColor.withOpacity(1),
          showUnselectedLabels: true,
          iconSize: 24,
          selectedFontSize: 12,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.campaign_outlined,
                ),
                label: "Campaign"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_outlined,
                ),
                label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active), label: "Profile"),
          ],
          currentIndex: currentScreenIndex,
          onTap: (value) => _screenindexprovider.updateScreenIndex(value),
          // indicatorColor: Constants.primaryColor.withOpacity(0.0),
          backgroundColor: Colors.white),
    );
  }
}
