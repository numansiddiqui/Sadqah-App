// ignore_for_file: prefer_const_constructors
import 'package:fluttbase/auth/login_or_register.dart';
import 'package:fluttbase/screens/profile_edit.dart';
import 'package:fluttbase/services/auth/auth_service.dart';
import 'package:fluttbase/services/model/user_model.dart';
import 'package:fluttbase/services/provider/database_provider.dart';
import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/widgets/features/Profile/history_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({
    super.key,
    required this.uid,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);

  final _auth = AuthService();

  UserProfile? user;

  String currentUserId = AuthService().getCurrentUser()!.uid;

  void signOut() {
    _auth.logoutUser().then((value) => {Navigator.maybePop(context)});
  }

  Future<void> loadUser() async {
    user = await databaseProvider.getUser(currentUserId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.backgroundColor.withOpacity(1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.backgroundColor.withOpacity(1),
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor:
                          Constants.secondaryColor.withOpacity(0.5),
                      child: Text(
                        "N",
                        style: TextStyle(
                            fontSize: 32,
                            color: Constants.primaryColor.withOpacity(1)),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.name ?? 'Loading...',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfileEdit(
                                                uid: _auth.getCurrentUserId(),
                                              )))
                                },
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color:
                                      Constants.primaryColor.withOpacity(0.8)),
                            ))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Account Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Constants.blackColor.withOpacity(0.8))),
                    Icon(Icons.chevron_right_sharp)
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Share Sadqah App !",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Constants.blackColor.withOpacity(0.8))),
                SizedBox(
                  height: 32,
                ),
                Text("History",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Constants.blackColor.withOpacity(0.8))),
                SizedBox(
                  height: 16,
                ),
                const Column(
                  children: [
                    HistoryCard(),
                    SizedBox(
                      height: 12,
                    ),
                    HistoryCard(),
                    SizedBox(
                      height: 12,
                    ),
                    HistoryCard()
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: signOut,
                  child: Text("Logout",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )),
        ));
  }
}
