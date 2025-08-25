import 'package:fittrack2/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Deletee2 extends StatefulWidget {
  const Deletee2({super.key});

  @override
  State<Deletee2> createState() => _Deletee2State();
}

class _Deletee2State extends State<Deletee2> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    setState(() {
      _isButtonEnabled = _passwordController.text.trim().length >= 4;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close, size: 30, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              CircleAvatar(
                radius: 50.r,
                backgroundImage: const AssetImage("images/profile pic.jpg"),
              ),
              SizedBox(height: 50.h),
              Text(
                "For your safety, please re-enter your password to continue",
                style: TextStyle(
                  color: AppColors.hilighter,
                  fontSize: 15.sp,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscureText,
                style: TextStyle(
                  color: AppColors.hilighter,
                  fontSize: 15.sp,
                ),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: AppColors.hilighter,
                    fontSize: 15.sp,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.hilighter,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: AppColors.hilighter,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: AppColors.hilighter,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 100.w),
                  backgroundColor: _isButtonEnabled
                      ? AppColors.background_1
                      : const Color.fromARGB(255, 171, 21, 21),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: _isButtonEnabled ? () {} : null,
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextButton(
                onPressed: () {
                  // TODO: Forgot password logic
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: AppColors.hilighter,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
