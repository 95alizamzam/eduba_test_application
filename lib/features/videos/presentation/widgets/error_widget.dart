import 'package:eduba_test_app/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorShapeWidget extends StatelessWidget {
  const ErrorShapeWidget({
    super.key,
    required this.errorMsg,
    required this.onTap,
  });

  final String errorMsg;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              errorMsg,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: red,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 6.h),
            ElevatedButton(
              onPressed: onTap,
              child: Text(
                'Retry',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: red,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
