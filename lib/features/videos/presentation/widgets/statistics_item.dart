import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticsItem extends StatelessWidget {
  const StatisticsItem({super.key, required this.label, required this.value});

  final String label, value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value.trim(),
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                label.trim(),
                style: TextStyle(fontSize: 16.sp),
              ),
            ],
          )),
    );
  }
}
