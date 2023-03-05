import 'package:eduba_test_app/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAllRow extends StatelessWidget {
  const ViewAllRow({
    super.key,
    required this.label,
    // required this.goTo,
  });

  final String label;
  // final VoidCallback goTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.maxFinite,
      height: 30.h,
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(color: red, fontSize: 12.sp),
          )
          // const Spacer(),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     const Text('View All'),
          //     IconButton(
          //       padding: EdgeInsets.zero,
          //       onPressed: goTo,
          //       icon: Icon(
          //         Icons.arrow_forward_ios_outlined,
          //         size: 20.sp,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
