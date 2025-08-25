import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconButton? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      child: Container(
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
            )
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
