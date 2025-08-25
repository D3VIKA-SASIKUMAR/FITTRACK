import 'package:fittrack2/views/settings/delete/delete_confirm_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fittrack2/widgets/appcolors.dart';

class Delete1 extends StatefulWidget {
  const Delete1({super.key});

  @override
  State<Delete1> createState() => _Delete1State();
}

class _Delete1State extends State<Delete1> {
  String? _selectedReason;

  final List<String> _reasons = [
    "Privacy concerns.",
    "Created a second account.",
    "Trouble getting started.",
    "Concerned about my data.",
    "Too busy/too distracting.",
    "Something else.",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close, size: 30, color: AppColors.hilighter),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Deleting your account",
                style: TextStyle(color: AppColors.hilighter, fontSize: 25.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                "We're sorry to see you go! Please let us know\nwhy you're leaving.",
                style: TextStyle(color: AppColors.hilighter, fontSize: 16.sp),
              ),
              SizedBox(height: 20.h),

              // 🟡 Radio buttons
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white,
                ),
                child: Column(
                  children: _reasons.map((reason) {
                    return RadioListTile<String>(
                      value: reason,
                      groupValue: _selectedReason,
                      onChanged: (value) {
                        setState(() {
                          _selectedReason = value;
                        });
                      },
                      title: Text(
                        reason,
                        style: TextStyle(
                          color: AppColors.hilighter,
                          fontSize: 14.sp,
                        ),
                      ),
                      activeColor: AppColors.hilighter,
                      controlAffinity: ListTileControlAffinity.leading,
                      visualDensity: VisualDensity.compact,
                    );
                  }).toList(),
                ),
              ),

              // ⬇️ 20.h space below radio buttons
              SizedBox(height: 60.h),

              // ✅ Button just below radio buttons
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: _selectedReason != null
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Deletee2(),
                                  ));
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.hilighter,
                        padding: EdgeInsets.symmetric(
                            horizontal: 90.w, vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 216, 228, 189),
                        padding: EdgeInsets.symmetric(
                            horizontal: 99.w, vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
