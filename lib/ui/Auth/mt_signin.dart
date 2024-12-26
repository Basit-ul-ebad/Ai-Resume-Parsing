import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/const.dart';
import 'package:flutter_application_1/ui/Home/mt_home_bottom_nav.dart';
import 'package:flutter_application_1/ui/auth/mt_signup.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Styles/style.dart';
import 'mt_forgot_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle errors such as wrong password or email
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided.');
      } else {
        throw Exception('Error: ${e.message}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        titleTextStyle: ktitleTextStyle.copyWith(fontSize: 20),
        leading: const BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                signInText,
                style: ksubTitleTextStyle,
              ),
              const SizedBox(
                height: 35,
              ),
              AppTextField(
                controller: emailController,
                textFieldType: TextFieldType.EMAIL,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: kTitleColor),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: "Email Address",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kTextFieldBorderColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextField(
                controller: passwordController,
                textFieldType: TextFieldType.PASSWORD,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  label: const Text("Password"),
                  labelStyle: TextStyle(color: kTitleColor),
                  hintText: "******",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kTextFieldBorderColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: ksubTitleTextStyle,
                ),
              ).onTap(() => const ForgotPasswordScreen().launch(context)),
              const SizedBox(
                height: 25,
              ),
              AppButton(
                text: "Sign In",
                textColor: kLikeWhiteColor,
                width: double.infinity,
                enableScaleAnimation: false,
                elevation: 0,
                color: kMainColor,
                onTap: () async {
                  try {
                    String email = emailController.text;
                    String password = passwordController.text;

                    // Call the sign-in function
                    User? user = await signInWithEmailAndPassword(email, password);
                    if (user != null) {
                      // If sign-in is successful, navigate to the Home screen
                      const HomeBottomNavBarScreen().launch(context);
                    } else {
                      // Handle sign-in failure (optional)
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid email or password"))
                      );
                    }
                  } catch (e) {
                    // Handle exceptions
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: ${e.toString()}"))
                    );
                  }
                },
                shapeBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: kSubTitleColor),
                  children: [
                    TextSpan(
                      text: "SIGN UP",
                      style: TextStyle(color: kMainColor),
                    ),
                  ],
                ),
              ).onTap(() => const SignUpScreen().launch(context)),
            ],
          ),
        ),
      ),
    );
  }
}
