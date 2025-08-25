import 'package:flutter/material.dart';
import 'package:flutter_picker_plus/flutter_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fittrack2/widgets/appcolors.dart';

void showWeightPicker(BuildContext context, Function(String) onSelected) {
  List<String> weightList = List.generate(
    400,
    (index) => (30 + index * 0.1).toStringAsFixed(1),
  );

  Picker(
    adapter: PickerDataAdapter<String>(pickerData: weightList),
    height: 300.h,
    selecteds: [124],
    onConfirm: (Picker picker, List<int> selecteds) {
      onSelected("${weightList[selecteds[0]]}Kg");
    },
    textStyle: TextStyle(fontSize: 18.sp, color: Colors.white),
    selectedTextStyle: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.hilighter,
    ),
    headerColor: Colors.black,
    containerColor: Colors.black,
    backgroundColor: AppColors.black,
    cancelTextStyle: const TextStyle(color: Colors.white),
    confirmTextStyle: const TextStyle(color: Colors.white),
    itemExtent: 40.h,
    columnPadding: EdgeInsets.symmetric(horizontal: 8.w),
  ).showModal(context);
}

void showHeightPicker(BuildContext context, Function(String) onSelected) {
  List<String> heightList = List.generate(
    151,
    (index) => "${100 + index}",
  ); // 100–250 cm

  Picker(
    adapter: PickerDataAdapter<String>(pickerData: heightList),
    height: 300.h,
    selecteds: [70],
    onConfirm: (Picker picker, List<int> selecteds) {
      onSelected("${heightList[selecteds[0]]} cm");
    },
    textStyle: TextStyle(fontSize: 18.sp, color: Colors.white),
    selectedTextStyle: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.hilighter,
    ),
    headerColor: Colors.black,
    containerColor: Colors.black,
    backgroundColor: AppColors.black,
    cancelTextStyle: const TextStyle(color: Colors.white),
    confirmTextStyle: const TextStyle(color: Colors.white),
    itemExtent: 40.h,
    columnPadding: EdgeInsets.symmetric(horizontal: 8.w),
  ).showModal(context);
}

void showAgePicker(BuildContext context, Function(String) onSelected) {
  List<String> ageList = List.generate(
    100,
    (index) => "${15 + index}",
  ); // 100–250 cm

  Picker(
    adapter: PickerDataAdapter<String>(pickerData: ageList),
    height: 300.h,
    selecteds: [10],
    onConfirm: (Picker picker, List<int> selecteds) {
      onSelected("${ageList[selecteds[0]]} years");
    },
    textStyle: TextStyle(fontSize: 18.sp, color: Colors.white),
    selectedTextStyle: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.hilighter,
    ),
    headerColor: Colors.black,
    containerColor: Colors.black,
    backgroundColor: AppColors.black,
    cancelTextStyle: const TextStyle(color: Colors.white),
    confirmTextStyle: const TextStyle(color: Colors.white),
    itemExtent: 40.h,
    columnPadding: EdgeInsets.symmetric(horizontal: 8.w),
  ).showModal(context);
}
