// ignore_for_file: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttbase/auth/login_or_register.dart';
import 'package:fluttbase/root_screen.dart';
import 'package:fluttbase/screens/home_screen.dart';
import 'package:fluttbase/screens/register_screen.dart';
import 'package:fluttbase/screens/verify_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const RootScreen();
          }
     
          else {
            return const LoginOrRegister();
          }
        });
  }
}
