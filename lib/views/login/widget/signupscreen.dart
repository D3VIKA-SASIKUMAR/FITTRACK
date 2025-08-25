import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderOption extends StatelessWidget {
  const GenderOption({
    super.key,
    required this.selectedGender,
    required this.genderText,
    required this.onTap,
  });

  final String? selectedGender;
  final String genderText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedGender == genderText
                  ? Colors.black
                  : Colors.transparent,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Icon(
              Icons.check,
              size: 16.sp,
              color: selectedGender == genderText
                  ? Colors.white
                  : Colors.transparent,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            genderText,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
