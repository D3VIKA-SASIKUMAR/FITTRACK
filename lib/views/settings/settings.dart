import 'package:fittrack2/views/settings/about.dart';
import 'package:fittrack2/views/settings/delete/delete_your_account.dart';
import 'package:fittrack2/views/login/loginscreen.dart';
import 'package:fittrack2/views/settings/managepermissions.dart';
import 'package:fittrack2/views/settings/profile.dart';
import 'package:fittrack2/views/settings/themes.dart';
import 'package:fittrack2/widgets/appcolors.dart';
import 'package:fittrack2/widgets/cards.dart';
import 'package:fittrack2/widgets/headingtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.sp,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Headingtext(text: "Settings", color: AppColors.white),
          backgroundColor: AppColors.background_2,
        ),
        backgroundColor: AppColors.background_2,
        body: Column(
          children: [
            SizedBox(height: 50.h),
            SettingsCard(
              title: "Profile",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
            ),
            SizedBox(height: 10.h),
            SettingsCard(
              title: "Themes",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Themes()),
                );
              },
            ),
            SizedBox(height: 10.h),
            SettingsCard(
              title: "Manage Permissions",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManagePermissionsScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            SettingsCard(
              title: "Reset Data",
              onTap: () {
                // Reset app data
              },
            ),
            SizedBox(height: 10.h),
            SettingsCard(
              title: "LogOut",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppColors.background_1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      title: Text(
                        "Are you sure you want to log out?",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: AppColors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginscreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Logout",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 16, 16),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(height: 10.h),
            SettingsCard(
              title: "Delete Account",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Delete1()),
                );
              },
            ),
            SizedBox(height: 10.h),
            SettingsCard(
              title: "About",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const About()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
