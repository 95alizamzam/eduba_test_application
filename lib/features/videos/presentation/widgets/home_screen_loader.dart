import 'package:eduba_test_app/features/videos/presentation/widgets/view_all_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/colors/app_colors.dart';

class HomeScreenLoader extends StatelessWidget {
  const HomeScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            shimmerWidget(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: red,
                ),
                height: 40,
                width: double.maxFinite,
              ),
            ),
            SizedBox(height: 20.h),
            const ViewAllRow(label: 'Trends'),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return shimmerWidget(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: red,
                      ),
                      width: 200,
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            SizedBox(height: 20.h),
            const ViewAllRow(label: 'Top Rated '),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return shimmerWidget(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: red,
                      ),
                      width: 200,
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            SizedBox(height: 20.h),
            const ViewAllRow(label: 'Recent Added'),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return shimmerWidget(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: red,
                      ),
                      width: 200,
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

Widget shimmerWidget({
  required Widget child,
}) {
  return Shimmer.fromColors(
    baseColor: white,
    highlightColor: Colors.grey.shade300,
    enabled: true,
    child: child,
  );
}
