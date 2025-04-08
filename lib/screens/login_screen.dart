// ignore_for_file: avoid_print, prefer_const_constructors
import 'package:fluttbase/helper/loading_circle.dart';
import 'package:fluttbase/services/auth/auth_service.dart';
import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/widgets/global/Button.dart';
import 'package:fluttbase/widgets/global/TextField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    showLoadingCircle(context);
    try {
      await _auth.loginEmailPassword(
          emailController.text, passwordController.text);
      if (mounted) hideLoadingCircle(context);
    } catch (e) {
      if (mounted) hideLoadingCircle(context);
      // if (mounted) {
      //   showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       title: Text(e.toString()),
      //     ),
      //   );
      // }
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.only(bottom: 32, top: 20),
                      child: Image.asset('assets/images/Logo.png'),
                    ),
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                        color: Color.fromARGB(255, 4, 78, 38),
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyTextField(
                      hintText: "Enter your email",
                      obscureText: false,
                      controller: emailController,
                      labelText: "Enter your Email"),
                  MyTextField(
                      hintText: "Create Password",
                      obscureText: true,
                      controller: passwordController,
                      labelText: "Enter your Password"),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(height: 20),
                  Button(
                    text: "Login",
                    onTap: login,
                  ),
                  const SizedBox(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Do no have an account? ",
                      style: TextStyle(
                          color: Constants.blackColor.withOpacity(1),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Signup here",
                        style: TextStyle(
                            color: Constants.blackColor.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    )
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
