import 'package:fittrack2/widgets/alertdiaolge.dart';
import 'package:fittrack2/widgets/appcolors.dart';
import 'package:fittrack2/widgets/custombutton.dart';
import 'package:fittrack2/widgets/headingtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker_plus/picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Setgoal extends StatefulWidget {
  const Setgoal({super.key});

  @override
  State<Setgoal> createState() => _SetgoalState();
}

class _SetgoalState extends State<Setgoal> {
  String selectedStepGoal = "10000 Steps";
  String selectedDistance = "5.0 km";

  List<String> stepCountList = List.generate(
    100000,
    (index) => "${index + 1}",
  ); // 1 - 100000 Steps
  List<String> distanceList = List.generate(
    496,
    (index) => (0.5 + index * 0.1).toStringAsFixed(1),
  ); // 0.5 km - 50.0 km

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.sp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Headingtext(text: "Set Goal", color: AppColors.white),
          backgroundColor: AppColors.background_2,
        ),
        backgroundColor: AppColors.background_2,
        body: Column(
          children: [
            SizedBox(height: 20.h),
            _buildPickerCard(
              label: "Step Goal",
              value: selectedStepGoal,
              onTap: _showStepCountPicker,
            ),
            _buildPickerCard(
              label: "Distance Goal",
              value: selectedDistance,
              onTap: _showDistancePicker,
            ),
            SizedBox(height: 10.h),
            Text(
              "Walking just  30mins a day can improve your\n heart health",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
            SizedBox(height: 80.h),
            CustomButton(text: "Reset to Default ", onPressed: () {}),
            SizedBox(height: 20.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.hilighter,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 125.w,
                  vertical: 15.h,
                ),
              ),
              // onPressed: () => Navigator.pushNamed(context, '/home'),
              onPressed: () {
                showGoalSetDialog(context);
              },
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showStepCountPicker() {
    Picker(
      adapter: PickerDataAdapter<String>(pickerData: stepCountList),
      height: 300.h,
      selecteds: [9999], // Default selected 10000 steps (index 9999)
      onConfirm: (Picker picker, List<int> selecteds) {
        setState(() {
          selectedStepGoal = "${stepCountList[selecteds[0]]} Steps";
        });
      },
      textStyle: TextStyle(fontSize: 18.sp, color: Colors.grey),
      selectedTextStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      cancelTextStyle: TextStyle(color: Colors.grey),
      confirmTextStyle: TextStyle(color: Colors.black),
      itemExtent: 40.h,
      columnPadding: EdgeInsets.symmetric(horizontal: 8.w),
    ).showModal(context);
  }

  void _showDistancePicker() {
    Picker(
      adapter: PickerDataAdapter<String>(pickerData: distanceList),
      height: 300.h,
      selecteds: [45], // Default selected 5.0 km (index 45)
      onConfirm: (Picker picker, List<int> selecteds) {
        setState(() {
          selectedDistance = "${distanceList[selecteds[0]]} km";
        });
      },
      textStyle: TextStyle(fontSize: 18.sp, color: Colors.grey),
      selectedTextStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      cancelTextStyle: TextStyle(color: Colors.grey),
      confirmTextStyle: TextStyle(color: Colors.black),
      itemExtent: 40.h,
      columnPadding: EdgeInsets.symmetric(horizontal: 8.w),
    ).showModal(context);
  }

  Widget _buildPickerCard({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_drop_down,
              color: AppColors.hilighter,
              size: 36.sp,
            ),
          ],
        ),
      ),
    );
  }
}
