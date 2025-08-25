import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fittrack2/widgets/appcolors.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text("About", style: TextStyle(color: AppColors.hilighter)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.hilighter),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Logo
            SizedBox(height: 40.h),
            Icon(Icons.fitness_center, color: AppColors.hilighter, size: 80.sp),
            SizedBox(height: 20.h),

            // App Name & Version
            Text(
              "FitTrack",
              style: TextStyle(
                  color: AppColors.hilighter,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "Version",
              style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
            ),
            SizedBox(height: 30.h),

            // Description
            Text(
              "FitTrack helps you monitor your fitness journey with personalized stats, goals, and reminders.",
              style: TextStyle(color: AppColors.hilighter, fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),

            // Contact Info
            Text(
              "Contact us: support@fittrack.app",
              style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
            ),
            SizedBox(height: 10.h),
            Text(
              "© 2025 FitTrack Inc.",
              style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
