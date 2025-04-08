// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:async';
import 'package:fluttbase/auth/login_or_register.dart';
import 'package:fluttbase/root_screen.dart';
import 'package:fluttbase/services/auth/auth_service.dart';
import 'package:fluttbase/widgets/global/Button.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreen();
}

class _VerifyScreen extends State<VerifyScreen> {
  bool isEmailVerified = false;
  final _auth = AuthService();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(Duration(seconds: 1), (_) => checkEmailVerification());
  }

  Future checkEmailVerification() async {
    setState(() {
      _auth.getCurrentUser()?.reload().then((_) {
        setState(() {
          isEmailVerified = _auth.getCurrentUser()!.emailVerified;
        });
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? RootScreen()
      : Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginOrRegister(),
                  ),
                );
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: const Text(
                    "Email Verification",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                const Text(
                  "Verify email through link sent to your email",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Button(
                    onTap: () {
                      _auth.sendVerificationEmail();
                    },
                    text: "Send Verification Link",
                  ),
                ),
              ],
            ),
          ));
}
