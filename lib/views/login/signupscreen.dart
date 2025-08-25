import 'package:fittrack2/views/login/weight_height.dart';
import 'package:fittrack2/views/login/widget/signupscreen.dart';
import 'package:fittrack2/widgets/appcolors.dart';
import 'package:fittrack2/widgets/custombutton.dart';
import 'package:fittrack2/widgets/headingtext.dart';
import 'package:fittrack2/widgets/textformfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  DateTime? selectedDate;
  String? selectedGender;
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _validateAndContinue() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter your name')));
      return;
    }

    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select your Date of Birth')),
      );
      return;
    }

    if (selectedGender == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select your Gender')));
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signupscreen2()),
    );
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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Headingtext(text: "My Profile", color: Colors.black),
          backgroundColor: AppColors.background_1,
        ),
        backgroundColor: AppColors.background_1,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    SizedBox(width: 50.w),
                    Text(
                      "Create an account to access your\npersonalized experience",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                CustomTextField(
                  hintText: "Name",
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),

                // ---- Date of Birth Field Added Below ----
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    height: 45.h,
                    width: 303.w,
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDate == null
                              ? "Date Of Birth"
                              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          Icons.calendar_today,
                          color: Colors.lightGreenAccent,
                          size: 24.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    SizedBox(width: 50.w),
                    Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins medium',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GenderOption(
                        genderText: "Female",
                        selectedGender: selectedGender,
                        onTap: () {
                          setState(() {
                            selectedGender = "Female";
                          });
                        },
                      ),
                      GenderOption(
                        genderText: "Male",
                        selectedGender: selectedGender,
                        onTap: () {
                          setState(() {
                            selectedGender = "Male";
                          });
                        },
                      ),
                      GenderOption(
                        genderText: "Prefer Not to say",
                        selectedGender: selectedGender,
                        onTap: () {
                          setState(() {
                            selectedGender = "Prefer Not to say";
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 190.h),
                CustomButton(
                  text: "Continue",
                  onPressed: () {
                    _validateAndContinue();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
