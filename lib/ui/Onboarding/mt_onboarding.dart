import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/const.dart';
import 'package:flutter_application_1/ui/Choose%20A%20Role/mt_choose_a_role.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var currentIndex = 0;
  var percent = 0.333;
  PageController pageController = PageController();
  List imageList = [
    "assets/images/resume-pic.png",
    "assets/images/find-candidate.png",
    "assets/images/parse-resume.png"
  ];
  List<String> tittleText = [
    "Upload Your Resume",
    "Find Top Candidate",
    "Parse the Resumes"
  ];
  List<String> description = [
    " Get detailed insights into resumes, highlighting skills, experiences, and qualifications",
    " Identify the best candidates quickly with intelligent resume screening and analysis tools.",
    " Easily find top talent by analyzing and parsing resumes with precision, saving you time and effort",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, // Set background color to white
        body: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Skip",
                  style: TextStyle(color: kSubTitleColor),
                ).onTap(() => const ChooseARoleScreen().launch(context)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: imageList.length,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(imageList[index],
                                height: context.height() / 2.3,
                                width: context.width()),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              tittleText[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: kTitleColor,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              description[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: kSubTitleColor,
                                height: 1.5,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var i = 0; i < imageList.length; i++)
                                  buildIndicator(currentIndex == i)
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 4.0,
                              progressColor: kMainColor,
                              percent: percent,
                              animation: true,
                              center: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex < 2
                                        ? percent = percent + 0.333
                                        : percent = 1.0;
                                    currentIndex < 2
                                        ? pageController.nextPage(
                                        duration: const Duration(
                                            microseconds: 3000),
                                        curve: Curves.bounceInOut)
                                        : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const ChooseARoleScreen()),
                                    );
                                  });
                                },
                                child: Container(
                                  height: 68,
                                  width: 68,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kMainColor),
                                  child: Image.asset("assets/images/arrow.png"),
                                ),
                              ),
                            )
                          ]),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Container(
          height: isSelected ? 12 : 8,
          width: isSelected ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? kMainColor : kMainColor.withOpacity(0.30),
          ),
        ));
  }
}
