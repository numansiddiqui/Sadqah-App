import 'package:fluttbase/helper/helper_function.dart';
import 'package:fluttbase/helper/loading_circle.dart';
import 'package:fluttbase/services/auth/auth_service.dart';
import 'package:fluttbase/services/functions/databse_services.dart';
import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/widgets/global/Button.dart';
import 'package:fluttbase/widgets/global/TextField.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onTap;
  const RegisterScreen({super.key, this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = AuthService();
  final _db = DatabaseService();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPwController = TextEditingController();

  register() async {
    if (passwordController.text == confirmPwController.text ) {
      showLoadingCircle(context);
      try {
        await _auth.registerEmailPassword(
          emailController.text,
          passwordController.text,
        );
        if (mounted) hideLoadingCircle(context);
        await _db.saveUserDataInFirebase(
            usernameController.text, emailController.text);
      } catch (e) {
        if (mounted) hideLoadingCircle(context);
        if (mounted) {
          print("error");
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      }
    }
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password dont match"),
        ),
      );
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
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Constants.primaryColor.withOpacity(1),
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyTextField(
                      hintText: "Enter your Name",
                      obscureText: false,
                      controller: usernameController,
                      labelText: "Enter your Name"),
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
                  MyTextField(
                      hintText: "Confirm Password",
                      obscureText: true,
                      controller: confirmPwController,
                      labelText: "Enter your Password"),
                  const SizedBox(height: 32),
                  Button(
                    text: "Signup",
                    onTap: register,
                  ),
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                          color: Constants.blackColor.withOpacity(1),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login",
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
