import 'package:fittrack2/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({super.key, required this.day, required this.percent});
  final String day;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 20.0,
          lineWidth: 4.0,
          percent: percent,
          progressColor: AppColors.hilighter,
          backgroundColor: Colors.black,
          circularStrokeCap: CircularStrokeCap.round,
          animation: true,
        ),
        SizedBox(height: 6),
        Text(
          day,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
