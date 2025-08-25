import 'package:fittrack2/views/dashBoard/dashboard.dart';
import 'package:fittrack2/views/dashBoard/startwalk/widgets/step_counter.dart';
import 'package:fittrack2/widgets/appcolors.dart';
import 'package:fittrack2/widgets/custombutton.dart';
import 'package:fittrack2/widgets/walksummarycard.dart';
import 'package:flutter/material.dart';

class Walksummary extends StatefulWidget {
  const Walksummary({super.key});

  @override
  State<Walksummary> createState() => _WalksummaryState();
}

class _WalksummaryState extends State<Walksummary> {
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inHours > 0 ? '${twoDigits(duration.inHours)}:' : ''}$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final activeTime = StepTracker().activeDuration;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.background_2,
          title: Center(
            child: Text(
              "Walk Summary",
              style: TextStyle(color: AppColors.white, fontSize: 28),
            ),
          ),
        ),
        backgroundColor: AppColors.background_2,
        body: Column(
          children: [
            StepCountCard(
              steps: StepTracker().stepCount,
              text: "Step Count",
              text2: "STEPS",
            ),
            StepCountCard(steps: 5, text: "Distance", text2: "KM"),
            StepCountCard(steps: 200, text: "Calories Burnt", text2: "CALS"),
            StepCountCard(
              steps: 0, // Placeholder
              text: "Active Time",
              text2: formatDuration(activeTime),
            ),
            const SizedBox(height: 150),
            CustomButton(
              text: "Save",
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
    );
  }
}
