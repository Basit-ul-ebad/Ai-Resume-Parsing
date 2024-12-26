import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/const.dart';
import 'package:flutter_application_1/ui/auth/mt_signin.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Styles/style.dart';
import 'package:flutter_application_1/ui/auth/mt_signup.dart';

class ChooseARoleScreen extends StatelessWidget {
  const ChooseARoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/logo.png'),
                height: 100,
                width: 100,
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/all-logos.png", // Placeholder image
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Choose Your Role",
                style: ktitleTextStyle.copyWith(
                  fontSize: 25,
                  color: kTitleColor, // Ensures compatibility with white background
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Discover the power of intelligent resume parsing. Choose your role to get started with efficient candidate screening and insights.",
                  style: ksubTitleTextStyle.copyWith(color: kSubTitleColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                text: "Sign Up as Recruiter",
                textColor: kMainColor,
                enableScaleAnimation: false,
                width: double.infinity,
                elevation: 0,
                color: kLikeWhiteColor,
                onTap: () => const SignUpScreen().launch(context),
                shapeBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                    borderRadius: BorderRadius.circular(6)),
              ),
              const SizedBox(
                height: 12,
              ),
              AppButton(
                text: "Sign In as Recruiter",
                textColor: kLikeWhiteColor,
                enableScaleAnimation: false,
                elevation: 0,
                width: double.infinity,
                color: kMainColor,
                onTap: () => const SignInScreen().launch(context),
                shapeBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(6)),
              ),
              const SizedBox(
                height: 12,
              ),
              AppButton(
                text: "Sign In as Candidate",
                textColor: kMainColor,
                enableScaleAnimation: false,
                elevation: 0,
                width: double.infinity,
                color: kLikeWhiteColor,
                onTap: () => const SignInScreen().launch(context),
                shapeBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
