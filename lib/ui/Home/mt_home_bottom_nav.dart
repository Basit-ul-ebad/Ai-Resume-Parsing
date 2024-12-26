import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_application_1/const/const.dart';
import 'package:flutter_application_1/ui/Home/mt_home.dart';
import 'package:flutter_application_1/ui/Profile/mt_profile.dart';

class HomeBottomNavBarScreen extends StatefulWidget {
  const HomeBottomNavBarScreen({super.key});

  @override
  State<HomeBottomNavBarScreen> createState() => _HomeBottomNavBarScreenState();
}

class _HomeBottomNavBarScreenState extends State<HomeBottomNavBarScreen> {
  int currentIndex = 0;

  // Correct the mapping of the screens to the tab index
  List<Widget> pages = [
    const HomeScreen(),
    // const PharmacyScreen(),  // Uncomment if you have a PharmacyScreen
    // const CartScreen(),  // Uncomment if you have a CartScreen
    // const MyHistoryScreen(),  // Uncomment if you have a MyHistoryScreen
    const ProfileScreen(),  // Ensure ProfileScreen is correctly in the list
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],  // Correct the usage of index for selecting page
      bottomNavigationBar: ConvexAppBar(
        height: 72,
        shadowColor: kSubTitleColor.withOpacity(0.1),
        style: TabStyle.fixedCircle,
        color: kSubTitleColor,
        backgroundColor: kLikeWhiteColor,
        activeColor: kMainColor,
        onTap: (value) {
          setState(() {
            currentIndex = value;  // Ensure currentIndex is updated when tab is clicked
          });
        },
        items: [
          TabItem(
            icon: Icon(
              IconlyBold.home,
              color: kSubTitleColor,
            ),
            title: "Home",
            activeIcon: Icon(
              IconlyBold.home,
              color: kMainColor,
            ),
          ),
          TabItem(
            icon: Icon(
              IconlyBold.profile,
              color: kSubTitleColor,
            ),
            title: "Profile", // Profile should be here
            activeIcon: Icon(
              IconlyBold.profile,
              color: kMainColor,
            ),
          ),
          TabItem(
            icon: Icon(
              IconlyBold.buy,
              color: kTitleColor,
            ),
            title: "",
            activeIcon: Icon(
              IconlyBold.buy,
              color: kLikeWhiteColor,
            ),
          ),
          TabItem(
            icon: Icon(
              IconlyBold.document,
              color: kSubTitleColor,
            ),
            title: "Document",
            activeIcon: Icon(
              IconlyBold.document,
              color: kMainColor,
            ),
          ),
          TabItem(
            icon: ImageIcon(
              const AssetImage(
                "assets/icons/company.png", // This is the Pharmacy tab icon
              ),
              color: kSubTitleColor,
            ),
            title: "Company",
            activeIcon: ImageIcon(
              const AssetImage(
                "assets/icons/company.png",
              ),
              color: kMainColor,
            ),
          ),
        ],
      ),
    );
  }
}
