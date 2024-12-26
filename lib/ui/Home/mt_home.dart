import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_application_1/const/const.dart';
import 'package:flutter_application_1/ui/Home/Notifications/mt_notifications.dart';
import 'package:flutter_application_1/ui/Styles/style.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_application_1/ui/Home/Resume_Work/view_all_candidates.dart';
import 'package:flutter_application_1/ui/Home/Resume_Work/add_Candidate.dart';
import 'package:badges/badges.dart' as badges;
import '../../model/mt_company_model.dart';
import 'package:flutter_application_1/ui/Home/Resume_Work/DocumentUploadPage.dart';
import 'package:flutter_application_1/model/template_models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 0.0,
        title: ListTile(
          tileColor: Colors.white,
          leading: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Image(
              image: AssetImage("assets/images/profile.webp"),
            ),
          ),
          title: Text(
            "Current Location",
            style: ksubTitleTextStyle.copyWith(fontSize: 12.0),
          ),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                IconlyLight.location,
                color: kMainColor,
                size: 18,
              ),
              Text(
                "United States",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: kMainColor),
              ),
              Icon(
                IconlyLight.arrowDown2,
                color: kMainColor,
                size: 20,
              ),
            ],
          ),
          trailing: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kTextFieldBorderColor, width: 1)),
            child: badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: kBadgeColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                badgeContent: Text(
                  "2",
                  style: TextStyle(color: kLikeWhiteColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    IconlyLight.notification,
                    color: kTitleColor,
                  ),
                )),
          ).onTap(() => const NotificationsScreen().launch(context)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                    prefixIcon: Icon(
                      IconlyLight.search,
                      color: kTitleColor,
                    ),
                    hintText: "Search...",
                    hintStyle: TextStyle(color: kSubTitleColor),
                    filled: true,
                    fillColor: kTextFieldColor),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: kDarkWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Featured Services",
                    style: ktitleTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Document Upload Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DocumentUploadPage()),
                    );
                  },
                  child: Container(
                    height: 125,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage("assets/images/Upload Resume Button.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Upload Resume",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18.0),
                          ),
                          Text(
                            "Easily upload your resume",
                            style: ktitleTextStyle.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the "Add Candidate" page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CandidateResumeListPage()),
                            );
                            },
                          child: Container(
                            height: 110,
                            width: double.infinity, // Ensure the width fills the available space
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage("assets/images/check resume.png"),
                                fit: BoxFit.cover, // Ensures the image covers the container
                                alignment: Alignment.center, // Centers the image to avoid cropping from one side
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft, // Align the text at the bottom-left
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "view Resumes",
                                  style: ktitleTextStyle.copyWith(fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          height: 110,
                          width: double.infinity, // Ensure the width fills the available space
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage("assets/images/find jobs.png"),
                              fit: BoxFit.cover, // Ensures the image covers the container
                              alignment: Alignment.center, // Centers the image to prevent cropping
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft, // Align the text at the bottom-left
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Find Jobs",
                                style: ktitleTextStyle.copyWith(fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the "Add Candidate" page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => JobApplicationForm()),
                            );
                          },
                          child: Container(
                            height: 110,
                            width: double.infinity, // Ensure the width fills the available space
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage("assets/images/parse resume.png"),
                                fit: BoxFit.cover, // Ensures the image covers the container
                                alignment: Alignment.center, // Centers the image to prevent cropping
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft, // Align the text at the bottom-left
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Enter Candidate",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Adjust text color as needed
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          height: 110, // Fixed height of the container
                          width: double.infinity, // Ensure the width fills the available space
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage("assets/images/see company details.png"),
                              fit: BoxFit.cover, // Ensures the image covers the container
                              alignment: Alignment.center, // Adjust alignment to prevent cropping
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft, // Align the text at the bottom-left
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Company Details",
                                style: ktitleTextStyle.copyWith(fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Companies",
                        style: ktitleTextStyle.copyWith(fontSize: 18.0),
                      ),
                      Text(
                        "View All",
                        style: ksubTitleTextStyle,
                      ),
                    ],
                  ),
              const SizedBox(
                height: 10,
              ),
              HorizontalList(
                runSpacing: 0.0,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 185,
                    width: context.width() / 1.3,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: kSubTitleColor.withOpacity(0.10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              minLeadingWidth: 0,
                              minVerticalPadding: 0,
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: kWatchColor.withOpacity(0.10), width: 2),
                                ),
                                child: badges.Badge(
                                  position: BadgePosition.topEnd(top: -2, end: 4),
                                  badgeStyle: badges.BadgeStyle(
                                    borderRadius: BorderRadius.circular(40),
                                    badgeColor: kWatchColor,
                                  ),
                                  badgeContent: Container(
                                    padding: EdgeInsets.zero,
                                    decoration: const BoxDecoration(shape: BoxShape.circle),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                          allCompanies[index].image ?? ''),
                                    ),
                                  ),
                                ),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  allCompanies[index].companyName ?? '',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    allCompanies[index].industry ?? '',
                                    style: TextStyle(fontWeight: FontWeight.w400, color: kMainColor),
                                  ),
                                  Text(
                                    allCompanies[index].location ?? '',
                                    style: const TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      IconlyBold.star,
                                      color: kStarColor,
                                      size: 12,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: allCompanies[index].ratings ?? '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400, color: kTitleColor),
                                            children: [
                                              const WidgetSpan(
                                                child: SizedBox(width: 5),
                                              ),
                                              TextSpan(
                                                text: "(100+ Ratings)",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400, color: kSubTitleColor),
                                              ),
                                            ]
                                        )
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      IconlyBold.timeCircle,
                                      color: kWatchColor,
                                      size: 14,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: allCompanies[index].experienceRequired ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400, color: kTitleColor),
                                          children: [
                                            const WidgetSpan(
                                              child: SizedBox(width: 6),
                                            ),
                                            TextSpan(
                                              text: "Year Exp",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400, color: kSubTitleColor),
                                            ),
                                          ]
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(
                                  Icons.monetization_on, // Use a money icon
                                  color: kMainColor,
                                  size: 14,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Salary: ${allCompanies[index].salaryRange ?? 'Not Available'}",
                                  style: TextStyle(fontWeight: FontWeight.w400, color: kTitleColor),
                                ),
                              ],
                            ),
                            const Spacer(),
                            AppButton(
                              text: "Send resume",
                              textColor: kMainColor,
                              width: double.infinity,
                              padding: EdgeInsets.zero,
                              enableScaleAnimation: false,
                              elevation: 0,
                              color: kMainColor,
                              //onTap: () {
                              // const BookAppoinment().launch(context);
                              // },
                              shapeBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },

                itemCount: allCompanies.length,
                spacing: 0.0,
              ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Resumes for Each Company",
                        style: ktitleTextStyle.copyWith(fontSize: 18),
                      ),
                      Text(
                        "View All",
                        style: ksubTitleTextStyle,
                      ) // .onTap(() => const DiagnosticsScreen().launch(context)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  HorizontalList(
                    padding: EdgeInsets.zero,
                    itemCount: allCompanies.length, // Use allCompanies.length for dynamic item count
                    itemBuilder: (BuildContext context, int index) {
                      var company = allCompanies[index]; // Access company data from your list

                      return SizedBox(
                        width: context.width() / 2.2,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(color: kSubTitleColor.withOpacity(0.10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(allCompanies[index].image ?? ''), // Assuming company data has a logo
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                    allCompanies[index].companyName ?? '', // Display company name
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, color: kTitleColor),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                FittedBox(
                                  child: Text(
                                    allCompanies[index].industry ?? '', // Assuming description of top resumes for the company
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400, color: kSubTitleColor),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "\$${allCompanies[index].salaryRange ?? ''}", // Displaying an example salary or any data related to the resume
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, color: kWatchColor),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                AppButton(
                                  text: "View Top Resumes",
                                  textColor: kMainColor,
                                  width: context.width(),
                                  elevation: 0,
                                  padding: EdgeInsets.zero,
                                  enableScaleAnimation: false,
                                  color: kMainColor,
                                  // onTap: () {
                                  //    Navigate to another page to view the resumes for the selected company
                                  // },
                                  shapeBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Resume Templates",
                        style: ktitleTextStyle,
                    ),
                    Text(
                        "View All",
                        style: ksubTitleTextStyle,
                    ),
                  ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  HorizontalList(
                      padding: EdgeInsets.zero,
                      itemCount: 4, // Update this to the number of templates you have
                    itemBuilder: (_, index) {
                      final template = templates[index];

                      return SizedBox(
                        width: context.width() / 2.2,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(color: kSubTitleColor.withOpacity(0.10)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    height: context.height() / 6,
                                    width: context.width() / 6,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(template['image']),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  // Container for Premium label
                                  Positioned(
                                    top: 4,
                                    left: 4,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                        ),
                                        color: kWatchColor,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          text: "Premium", // First part: "Premium"
                                          style: TextStyle(
                                            color: Colors.white, // "Premium" in white
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: " Template", // Second part: "Template"
                                              style: TextStyle(
                                                color: Colors.black, // "Template" in black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      template['name'], // Dynamic title
                                      style: const TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: template['price'], // Dynamic price
                                        style: TextStyle(color: kWatchColor),
                                        children: [
                                          const WidgetSpan(
                                            child: SizedBox(width: 10),
                                          ),
                                          TextSpan(
                                            text: template['originalPrice'], // Dynamic original price
                                            style: TextStyle(
                                              color: kSubTitleColor,
                                              decoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    AppButton(
                                      text: "Get Template",
                                      textColor: kMainColor,
                                      enableScaleAnimation: false,
                                      width: context.width(),
                                      elevation: 0,
                                      padding: EdgeInsets.zero,
                                      color: kMainColor,
                                      //onTap: () => const TemplateDetailScreen().launch(context),
                                      shapeBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },)
                ],),
            ),
          ],
        ),
      ),
    );
  }
}
