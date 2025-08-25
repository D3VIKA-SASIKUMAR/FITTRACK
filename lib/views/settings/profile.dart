import 'package:fittrack2/widgets/wheelpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fittrack2/widgets/appcolors.dart';
import 'package:fittrack2/widgets/headingtext.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedWeight = "154.3 lbs";
  String selectedHeight = "170 cm";
  String gender = "Female";
  String age = "25";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.sp,
              color: AppColors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Headingtext(text: "Profile", color: AppColors.white),
          backgroundColor: AppColors.background_2,
        ),
        backgroundColor: AppColors.background_2,
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Center(
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage: const AssetImage("images/profile pic.jpg"),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  "Natasha Mathew",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  "natashamathew@gmail.com",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Divider(color: AppColors.white, thickness: 1.5),
              SizedBox(height: 30.h),

              // Weight row
              ListTile(
                title: Text(
                  "Weight",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                subtitle: Text(
                  "Required for calories calculation",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                trailing: TextButton(
                  onPressed: () async {
                    showWeightPicker(context, (String newWeight) {
                      setState(() {
                        selectedWeight = newWeight;
                      });
                    });
                  },
                  child: Text(
                    selectedWeight,
                    style: TextStyle(
                      color: AppColors.hilighter,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              // Height row
              ListTile(
                title: Text(
                  "Height",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                subtitle: Text(
                  "Required for distance & speed calculation",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                trailing: TextButton(
                  onPressed: () async {
                    showHeightPicker(context, (String newHeight) {
                      if (newHeight.isNotEmpty) {
                        setState(() {
                          selectedHeight = newHeight;
                        });
                      }
                    });
                  },
                  child: Text(
                    selectedHeight,
                    style: TextStyle(
                      color: AppColors.hilighter,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              // Gender row with inline dropdown
              ListTile(
                title: Text(
                  "Gender",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                subtitle: Text(
                  "Required for stride length calculation",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (String value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(value: "Male", child: Text("Male")),
                    const PopupMenuItem(value: "Female", child: Text("Female")),
                    const PopupMenuItem(value: "Other", child: Text("Other")),
                  ],
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        gender,
                        style: TextStyle(
                          color: AppColors.hilighter,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.sp,
                        color: AppColors.hilighter,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: Text(
                  "Age",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                subtitle: Text(
                  "Required for distance & speed calculation",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                trailing: TextButton(
                  onPressed: () async {
                    showAgePicker(context, (String newHeight) {
                      if (newHeight.isNotEmpty) {
                        setState(() {
                          selectedHeight = newHeight;
                        });
                      }
                    });
                  },
                  child: Text(
                    selectedHeight,
                    style: TextStyle(
                      color: AppColors.hilighter,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
