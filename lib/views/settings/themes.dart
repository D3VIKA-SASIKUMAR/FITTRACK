// themes.dart
import 'package:fittrack2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fittrack2/widgets/appcolors.dart';
import 'package:fittrack2/widgets/headingtext.dart';

class Themes extends StatefulWidget {
  const Themes({super.key});

  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  @override
  Widget build(BuildContext context) {
    bool isDark = themeNotifier.value == ThemeMode.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.sp,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Headingtext(text: "Themes", color: Colors.white),
          backgroundColor: AppColors.background_2,
        ),
        backgroundColor: AppColors.background_2,
        body: Column(
          children: [
            SizedBox(height: 50.h),
            Center(
              child: SizedBox(
                height: 80.h,
                width: 330.w,
                child: Card(
                  color: AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          "Dark Mode | Light Mode",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Switch(
                            value: isDark,
                            onChanged: (_) {
                              themeNotifier.toggleTheme();
                              setState(() {});
                            },
                            activeThumbColor: Colors.black,
                            activeTrackColor: AppColors.hilighter,
                            inactiveThumbColor: AppColors.background_2,
                            inactiveTrackColor: AppColors.background_1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
