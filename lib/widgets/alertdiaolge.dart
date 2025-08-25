import 'package:fittrack2/views/dashBoard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fittrack2/widgets/appcolors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showGoalSetDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.background_1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        contentPadding: EdgeInsets.all(16.w),
        content: SizedBox(
          width: 280.w,
          height: 100.h,
          child: Center(
            child: Text(
              "Your Goal Set.\nYou are free to go!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dashboard())),
            child: Text(
              "OK",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ],
      );
    },
  );
}
