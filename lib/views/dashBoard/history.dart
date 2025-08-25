// import 'package:fittrack/widgets/appcolors.dart';
// import 'package:fittrack/widgets/headingtext.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fl_chart/fl_chart.dart';

// class History extends StatefulWidget {
//   const History({super.key});

//   @override
//   State<History> createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
//   String selectedRange = "Today";

//   final List<String> timeOptions = ["Today", "Yesterday", "Past 7 Days"];

//   final Map<String, List<int>> stepData = {
//     "Today": [400, 700, 700, 200, 600, 800, 300, 600, 500, 700],
//     "Yesterday": [300, 500, 600, 400, 700, 600, 500, 400, 600, 800],
//     "Past 7 Days": [500, 650, 700, 550, 600, 700, 800]
//   };

//   final Map<String, List<String>> labels = {
//     "Today": ["12am", "2am", "4am", "6am", "8am", "10am", "12pm", "2pm", "4pm", "6pm"],
//     "Yesterday": ["12am", "2am", "4am", "6am", "8am", "10am", "12pm", "2pm", "4pm", "6pm"],
//     "Past 7 Days": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
//   };

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios_new,
//               size: 20.sp,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: Headingtext(
//             text: "History",
//             color: AppColors.white,
//           ),
//           backgroundColor: AppColors.background_2,
//         ),
//         backgroundColor: AppColors.background_2,
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildTimeRangeDropdown(),
//               SizedBox(height: 20.h),
//               Expanded(child: _buildChart()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTimeRangeDropdown() {
//     return Container(
//       height: 30.h,
//       padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
//       decoration: BoxDecoration(
//         color: AppColors.hilighter,
//         borderRadius: BorderRadius.circular(40.r),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           value: selectedRange,
//           icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
//           iconSize: 20.sp,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w600,
//           ),
//           dropdownColor: AppColors.background_1,
//           borderRadius: BorderRadius.circular(12.r),
//           onChanged: (String? newValue) {
//             if (newValue != null) {
//               setState(() {
//                 selectedRange = newValue;
//               });
//             }
//           },
//           items: timeOptions.map((value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   Widget _buildChart() {
//     final data = stepData[selectedRange]!;
//     final labelsList = labels[selectedRange]!;
//     final maxY = (data.reduce((a, b) => a > b ? a : b) * 1.2).toInt();

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(12.r),
//       ),
//       padding: EdgeInsets.all(16.r),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "${data.reduce((a, b) => a + b)} steps",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 24.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 16.h),
//           Expanded(
//             child: BarChart(
//               BarChartData(
//                 maxY: maxY.toDouble(),
//                 borderData: FlBorderData(show: false),
//                 gridData: FlGridData(show: false),
//                 titlesData: FlTitlesData(
//                   leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                   rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                   topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       getTitlesWidget: (value, meta) {
//                         final index = value.toInt();
//                         if (index < 0 || index >= labelsList.length) return Container();
//                         return SideTitleWidget(
//                           axisSide: meta.axisSide,
//                           space: 4,
//                           child: Text(
//                             labelsList[index],
//                             style: TextStyle(color: Colors.white, fontSize: 10.sp),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 barGroups: List.generate(data.length, (i) {
//                   return BarChartGroupData(
//                     x: i,
//                     barRods: [
//                       BarChartRodData(
//                         toY: data[i].toDouble(),
//                         color: AppColors.hilighter,
//                         width: 12.w,
//                         borderRadius: BorderRadius.circular(4),
//                         rodStackItems: [],
//                         meta: const BarChartRodStackItemMeta(),
//                       ),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
