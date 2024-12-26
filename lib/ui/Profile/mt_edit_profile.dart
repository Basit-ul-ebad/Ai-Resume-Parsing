import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../const/const.dart';
import '../Styles/style.dart';
import 'mt_my_profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Widget _buildDropdownItem(Country country) => SizedBox(
    width: 80.0,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "+${country.phoneCode}",
          style: const TextStyle(fontSize: 12.0),
        ),
      ],
    ),
  );
  var gender = ["Male", "Female"];
  var selection = "Male";
  var bgValue = "A+";
  var ageValue = "10+";

  var bloodGroup = [
    "A+",
    "A-",
    "B+",
    "B-",
    "0+",
    "0-",
    "AB+",
    "AB-",
  ];
  var agedropdownValue = [
    "10+",
    "15+",
    "20+",
    "25+",
    "30+",
    "35+",
    "40+",
  ];

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
          "Edit Profile",
          style: ktitleTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              IconlyBold.edit,
              color: kWatchColor,
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AppButton(
          text: "Update",
          textColor: kLikeWhiteColor,
          elevation: 0,
          color: kMainColor,
          onTap: () {
            setState(() {
              const MyProfileScreen().launch(context);
            });
          },
          //  padding: EdgeInsets.zero,
          shapeBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(6)),
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
                        backgroundImage: AssetImage('assets/images/profile-logo.png'),
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
                          "Ibne Riead",
                          style: TextStyle(color: kLikeWhiteColor, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "Phone Number: 01855671615",
                          style: TextStyle(color: kLikeWhiteColor),
                        ),
                        Text(
                          "User ID: #74957485",
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Details",
                        style: ktitleTextStyle,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AppTextField(
                          textFieldType: TextFieldType.NAME,
                          decoration: InputDecoration(
                            label: const Text("Full Name"),
                            labelStyle: TextStyle(color: kTitleColor),
                            hintText: "Jane Cooper",
                            hintStyle: TextStyle(color: kSubTitleColor),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      AppTextField(
                          textFieldType: TextFieldType.EMAIL,
                          decoration: InputDecoration(
                            label: const Text("Email"),
                            labelStyle: TextStyle(color: kTitleColor),
                            hintText: "janecooper@gmail.com",
                            hintStyle: TextStyle(color: kSubTitleColor),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      AppTextField(
                        textFieldType: TextFieldType.NUMBER,
                        decoration: InputDecoration(
                            hintText: "0887868743",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CountryPickerDropdown(
                                initialValue: 'AR',
                                iconSize: 18.0,
                                itemBuilder: _buildDropdownItem,
                                priorityList: [
                                  CountryPickerUtils.getCountryByIsoCode('GB'),
                                  CountryPickerUtils.getCountryByIsoCode('CN'),
                                ],
                                sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                                onValuePicked: (Country country) {},
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 60.0,
                        child: FormField(
                          builder: (FormFieldState<dynamic> field) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                labelText: 'Gender',
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                              ),
                              child: DropdownButtonHideUnderline(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: DropdownButton(
                                    value: selection,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: kSubTitleColor,
                                    ),
                                    items: gender.map((String items) {
                                      return DropdownMenuItem(value: items, child: Text(items));
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        selection = val!;
                                      });
                                    }),
                              )),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 60.0,
                        child: FormField(
                          builder: (FormFieldState<dynamic> field) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                labelText: 'Blood Group',
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                              ),
                              child: DropdownButtonHideUnderline(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: DropdownButton(
                                    value: bgValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: kSubTitleColor,
                                    ),
                                    items: bloodGroup.map((String items) {
                                      return DropdownMenuItem(value: items, child: Text(items));
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        bgValue = val!;
                                      });
                                    }),
                              )),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 60.0,
                        child: FormField(
                          builder: (FormFieldState<dynamic> field) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                labelText: 'Age',
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                              ),
                              child: DropdownButtonHideUnderline(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: DropdownButton(
                                    value: ageValue,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: kSubTitleColor,
                                    ),
                                    items: agedropdownValue.map((String items) {
                                      return DropdownMenuItem(value: items, child: Text(items));
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        ageValue = val!;
                                      });
                                    }),
                              )),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppTextField(
                          textFieldType: TextFieldType.NAME,
                          decoration: InputDecoration(
                            label: const Text("Weight"),
                            labelStyle: TextStyle(color: kTitleColor),
                            hintText: "Enter your weight",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kSubTitleColor.withOpacity(0.3))),
                          )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
