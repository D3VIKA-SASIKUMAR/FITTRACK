import 'package:fittrack2/widgets/themenotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fittrack2/views/splashScreen/splashscreen.dart';
// Custom class from earlier

late ThemeNotifier themeNotifier;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedTheme = await ThemeNotifier.getSavedTheme();
  themeNotifier = ThemeNotifier(savedTheme);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeNotifier,
          builder: (context, mode, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: mode,
              home: const Splashscreen(),
            );
          },
        );
      },
    );
  }
}
