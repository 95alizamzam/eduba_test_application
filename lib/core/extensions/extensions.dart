import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetX on Widget {
  Widget center() {
    return Center(child: this);
  }

  Widget paddingLeft(double value) {
    return Padding(
      padding: EdgeInsets.only(left: value.w),
      child: this,
    );
  }

  Widget paddingRight(double value) {
    return Padding(
      padding: EdgeInsets.only(right: value.w),
      child: this,
    );
  }

  Widget paddingTop(double value) {
    return Padding(
      padding: EdgeInsets.only(top: value.h),
      child: this,
    );
  }

  Widget paddingBottom(double value) {
    return Padding(
      padding: EdgeInsets.only(bottom: value.h),
      child: this,
    );
  }

  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }
}
