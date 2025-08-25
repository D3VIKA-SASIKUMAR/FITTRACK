import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardBadge extends StatelessWidget {
  const DashBoardBadge({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
    required this.unit,
    required this.iconColor,
    required this.textColor,
  });
  final IconData icon;
  final Color color;
  final String label;
  final String unit;
  final Color iconColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24.sp, color: iconColor),
          SizedBox(width: 6.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                unit,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
