import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/Home/mt_home_bottom_nav.dart';
import 'package:flutter_application_1/ui/widgets/elevated_button.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../const/const.dart';
import '../Styles/style.dart';

class PhoneVarificationScreen extends StatefulWidget {
  const PhoneVarificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhoneVarificationScreenState createState() =>
      _PhoneVarificationScreenState();
}

class _PhoneVarificationScreenState extends State<PhoneVarificationScreen> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;
  late FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        titleTextStyle: ktitleTextStyle.copyWith(fontSize: 20),
        leading: const BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the verification code sent at your Email address",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 50.0,
                            child: TextFormField(
                              autofocus: true,
                              obscureText: true,
                              style: const TextStyle(fontSize: 24, height: 2),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: otpInputDecoration,
                              onChanged: (value) {
                                nextField(value, pin2FocusNode);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                            child: TextFormField(
                              focusNode: pin2FocusNode,
                              obscureText: true,
                              style: const TextStyle(fontSize: 24, height: 2),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: otpInputDecoration,
                              onChanged: (value) =>
                                  nextField(value, pin3FocusNode),
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                            child: TextFormField(
                              focusNode: pin3FocusNode,
                              obscureText: true,
                              style: const TextStyle(fontSize: 24, height: 2),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: otpInputDecoration,
                              onChanged: (value) =>
                                  nextField(value, pin4FocusNode),
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                            child: TextFormField(
                              focusNode: pin4FocusNode,
                              obscureText: true,
                              style: const TextStyle(fontSize: 24, height: 2),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: otpInputDecoration,
                              onChanged: (value) =>
                                  nextField(value, pin5FocusNode),
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                            child: TextFormField(
                              focusNode: pin5FocusNode,
                              obscureText: true,
                              style: const TextStyle(fontSize: 24, height: 2),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: otpInputDecoration,
                              onChanged: (value) =>
                                  nextField(value, pin6FocusNode),
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                            child: TextFormField(
                              focusNode: pin6FocusNode,
                              obscureText: true,
                              style: const TextStyle(fontSize: 24, height: 2),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: otpInputDecoration,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  pin6FocusNode.unfocus();
                                  // Then you need to check is the code is correct or not
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "You can request OTP after ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: kSubTitleColor),
                      children: [
                        TextSpan(
                          text: "01:52",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: kOtpRedColor),
                        )
                      ])),
              const SizedBox(
                height: 25,
              ),
              AppElevatedButton("Verify",
                  () => const HomeBottomNavBarScreen().launch(context))
            ],
          ),
        ),
      ),
    );
  }
}
