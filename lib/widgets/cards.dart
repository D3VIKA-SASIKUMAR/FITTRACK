import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fittrack2/widgets/appcolors.dart'; // If you have your colors setup

class SettingsCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingsCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.background_1, // or your custom highlight color
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18.sp,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
