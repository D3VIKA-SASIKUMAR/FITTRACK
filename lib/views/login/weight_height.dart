import 'package:fittrack2/views/dashBoard/dashboard.dart';
import 'package:fittrack2/views/login/widget/picker_card.dart';
import 'package:fittrack2/widgets/appcolors.dart';
import 'package:fittrack2/widgets/custombutton.dart';
import 'package:fittrack2/widgets/headingtext.dart';
import 'package:fittrack2/widgets/wheelpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signupscreen2 extends StatefulWidget {
  const Signupscreen2({super.key});

  @override
  State<Signupscreen2> createState() => _Signupscreen2State();
}

class _Signupscreen2State extends State<Signupscreen2> {
  String selectedHeight = "0cm";
  String selectedWeight = "0Kg";

  void _onHeightTap() {
    showHeightPicker(context, (newHeight) {
      setState(() {
        selectedHeight = newHeight;
      });
    });
  }

  void _onWeightTap() {
    showWeightPicker(context, (newWeight) {
      setState(() {
        selectedWeight = newWeight;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.sp,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Headingtext(text: "My Profile"),
          backgroundColor: AppColors.background_1,
        ),
        backgroundColor: AppColors.background_1,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Text(
                  "Create an account to access your\npersonalized experience",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              PickerCard(
                label: "Height",
                value: selectedHeight,
                onTap: _onHeightTap,
              ),
              PickerCard(
                label: "Weight",
                value: selectedWeight,
                onTap: _onWeightTap,
              ),
              SizedBox(height: 190.h),
              CustomButton(
                text: "Finish",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
