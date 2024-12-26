import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../const/const.dart';
import '../../Styles/style.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List tittleName = ["Reminder", "Appointment Alarm", "Appointment Confirmed"];

  List subTittle = [
    "1 min ago",
    "5 min ago",
    "20 min ago",
  ];

  List icons = [
    IconlyLight.notification,
    IconlyLight.timeCircle,
    IconlyLight.notification,
  ];

  List colors = [kStarColor, kBadgeColor, kWatchColor];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLikeWhiteColor,
      appBar: AppBar(
        backgroundColor: kLikeWhiteColor,
        elevation: 0,
        leading: BackButton(
          color: kTitleColor,
        ),
        title: Text(
          "Notifications",
          style: ktitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today - 12 July 2022",
                style: TextStyle(fontWeight: FontWeight.w600, color: kSubTitleColor),
              ),
              const SizedBox(
                height: 12.0,
              ),
              ListView.builder(
                  itemCount: tittleName.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        color: kLikeWhiteColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: kSubTitleColor.withOpacity(0.10))),
                        child: ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: colors[index].withOpacity(0.1)),
                            child: Icon(
                              icons[index],
                              color: colors[index],
                            ),
                          ),
                          title: Text(
                            tittleName[index],
                            style: TextStyle(fontWeight: FontWeight.w600, color: kTitleColor),
                          ),
                          subtitle: Text(
                            subTittle[index],
                            style: TextStyle(fontWeight: FontWeight.w400, color: kSubTitleColor),
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Yesterday - 11 July 2022",
                style: TextStyle(fontWeight: FontWeight.w600, color: kSubTitleColor),
              ),
              const SizedBox(
                height: 12.0,
              ),
              ListView.builder(
                  itemCount: tittleName.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        color: kLikeWhiteColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: kSubTitleColor.withOpacity(0.10))),
                        child: ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: colors[index].withOpacity(0.1)),
                            child: Icon(
                              icons[index],
                              color: colors[index],
                            ),
                          ),
                          title: Text(
                            tittleName[index],
                            style: TextStyle(fontWeight: FontWeight.w600, color: kTitleColor),
                          ),
                          subtitle: Text(
                            subTittle[index],
                            style: TextStyle(fontWeight: FontWeight.w400, color: kSubTitleColor),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
