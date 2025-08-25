import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Headingtext extends StatelessWidget {
  final String text;
  final Color? color;

  const Headingtext({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins Regular',
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}
