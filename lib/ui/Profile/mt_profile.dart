import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_application_1/ui/Profile/About%20Us/mt_about_us.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_application_1/ui/Profile/firebase_user_fetch.dart';
import '../../const/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import '../History/mt_history.dart';
import '../Styles/style.dart';
import 'Jobs Applied/mt_excersize_reminder.dart';
import 'Interview Reminders/mt_medicine_reminders.dart';
//import 'Weekly Checkup/mt_weekly_checkup.dart';
import 'mt_my_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String name = '';
  String email = '';
  String phone = '';
  List colors = [kMainColor, kStarColor, kWatchColor, kBadgeColor];

  // Fetch user data and update state
  void _fetchUserData() async {
    FirestoreService firestoreService = FirestoreService();
    Map<String, String> userData = await firestoreService.fetchUserData();

    setState(() {
      name = userData['name'] ?? 'Unknown';
      email = userData['email'] ?? 'Unknown';
      phone = userData['phone']?? 'Unknown';
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kLikeWhiteColor,
        elevation: 0,
        leading: BackButton(
          color: kTitleColor,
        ),
        title: Text(
          "Profile",
          style: ktitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 85,
                width: context.width(),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/profile-banner.png",
                        ),
                        fit: BoxFit.fill)),
                child: Center(
                    child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.webp'),
                        radius: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              color: kLikeWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          email,
                          style: TextStyle(color: kLikeWhiteColor),
                        ),
                        Text(
                          phone,
                          style: TextStyle(color: kLikeWhiteColor),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: kbigContainerColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kMainColor.withOpacity(0.12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyBold.profile,
                              color: kMainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "My Profile",
                          style: ksubTitleTextStyle,
                        ),
                        const Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: kSubTitleColor,
                            ))
                      ],
                    ).onTap(() {
                      const MyProfileScreen().launch(context);
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kStarColor.withOpacity(0.12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyBold.document,
                              color: kStarColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "History",
                          style: ksubTitleTextStyle,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: kSubTitleColor,
                          ),
                        )
                      ],
                    )//.onTap(
                      //() => const MyHistoryScreen().launch(context),
                   // ),
                   ,
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kWatchColor.withOpacity(0.12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyBold.document,
                              color: kWatchColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Wishlist",
                          style: ksubTitleTextStyle,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: kSubTitleColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kBadgeColor.withOpacity(0.12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyBold.document,
                              color: kBadgeColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Your Resumes",
                          style: ksubTitleTextStyle,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: kSubTitleColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kMainColor.withOpacity(0.12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyBroken.calendar,
                              color: kMainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Interview Reminders",
                          style: ksubTitleTextStyle,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: kSubTitleColor,
                          ),
                        ),
                      ],
                    ).onTap(
                      () => const MedicineRemindersScreen().launch(context),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kStarColor.withOpacity(0.12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyBold.activity,
                              color: kStarColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Jobs Applied",
                          style: ksubTitleTextStyle,
                        ),
                        const Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: kSubTitleColor,
                            ))
                      ],
                    ).onTap(
                        () => const ExcersizeReminderScreen().launch(context)),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kWatchColor.withOpacity(0.12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyBold.star,
                              color: kWatchColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Rate us",
                          style: ksubTitleTextStyle,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: kSubTitleColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kBadgeColor.withOpacity(0.12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyBold.infoCircle,
                              color: kBadgeColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "About us",
                          style: ksubTitleTextStyle,
                        ),
                        const Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: kSubTitleColor,
                            ))
                      ],
                    ).onTap(() => const AboutUsScreen().launch(context)),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kMainColor.withOpacity(0.12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyBold.logout,
                              color: kMainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Log out",
                          style: ksubTitleTextStyle,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: kSubTitleColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
