import 'package:fittrack2/views/dashBoard/setgoal.dart';
import 'package:fittrack2/views/dashBoard/widget/dash_board_badge.dart';
import 'package:fittrack2/views/dashBoard/widget/dashboard_card.dart';
import 'package:fittrack2/views/dashBoard/widget/percent_indicator.dart';
import 'package:fittrack2/views/settings/settings.dart';
import 'package:fittrack2/views/dashBoard/startwalk/startwalk.dart';
import 'package:fittrack2/widgets/appcolors.dart';
import 'package:fittrack2/widgets/headingtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background_2,
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 15.w),
                Headingtext(text: "Today", color: AppColors.white),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Settings()),
                    );
                  },
                  icon: Icon(Icons.settings, color: AppColors.hilighter),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              height: 100.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: AppColors.background_1,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10),
                        child: Text(
                          "Do you know?",
                          style: TextStyle(
                            fontFamily: 'Poppins Regular',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10),
                        child: Text(
                          "Regular exercises for 150 minutes a week can\nimprove your sleep and health",
                          style: TextStyle(
                            fontFamily: 'Poppins Regular',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardCard(
                    icon: Icons.directions_walk,
                    label: "Start walk",
                    onTap: () {
                      _navigateToScreen(context, const Startwalk());
                    },
                  ),
                  DashboardCard(
                    icon: Icons.history,
                    label: "History",
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const History(),
                      //   ),
                      // );
                    },
                  ),
                  DashboardCard(
                    icon: Icons.flag,
                    label: "Set Goal",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Setgoal()),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 300.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 10),
                        child: Text(
                          "1250",
                          style: TextStyle(
                            fontFamily: 'Poppins Regular',
                            fontSize: 58.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.hilighter,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          "Steps",
                          style: TextStyle(
                            fontFamily: 'Poppins Regular',
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashBoardBadge(
                          icon: Icons.timer,
                          label: "90",
                          unit: "mins",
                          color: Colors.lightGreenAccent.shade100,
                          iconColor: Colors.black,
                          textColor: Colors.black,
                        ),
                        DashBoardBadge(
                          icon: Icons.location_on,
                          label: "5",
                          unit: "Km",
                          color: Colors.deepPurple.shade100,
                          iconColor: Colors.black,
                          textColor: Colors.black,
                        ),
                        DashBoardBadge(
                          icon: Icons.local_fire_department,
                          label: "909",
                          unit: "cals",
                          color: Colors.red.shade200,
                          iconColor: Colors.black,
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  // Weekdays Circles Start
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PercentIndicator(day: "M", percent: 0.7),
                        PercentIndicator(day: "T", percent: .8),
                        PercentIndicator(day: "W", percent: .5),
                        PercentIndicator(day: "T", percent: .9),
                        PercentIndicator(day: "F", percent: .6),
                        PercentIndicator(day: "S", percent: 0.7),
                        PercentIndicator(day: "S", percent: .8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              color: AppColors.background_1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sleep  Progress",
                      style: TextStyle(
                        fontFamily: 'Poppins Regular',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
