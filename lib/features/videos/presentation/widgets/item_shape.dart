import 'package:eduba_test_app/core/colors/app_colors.dart';
import 'package:eduba_test_app/core/navigation/navigation_services.dart';
import 'package:eduba_test_app/core/service_locator/sl.dart';
import 'package:eduba_test_app/features/videos/presentation/screens/video_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entity/video_entity.dart';

import '../../../../core/extensions/extensions.dart';
import 'cached_image.dart';

class ItemShape extends StatelessWidget {
  const ItemShape({super.key, required this.video});

  final VideoEntity video;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        sl<NavigationServices>().goTo(
          context: context,
          targetScreen: VideoDetailsScreen(videoDetails: video),
        );
      },
      child: Container(
        width: 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: white),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.vertical(
            //     top: Radius.circular(10.r),
            //   ),
            //   child: FadeInImage(
            //     width: 300.w,
            //     height: 100.h,
            //     fit: BoxFit.fill,
            //     imageErrorBuilder: (context, error, stackTrace) => Image.asset(
            //       'assets/images/error_img.png',
            //       width: 300.w,
            //       height: 100.h,
            //       fit: BoxFit.cover,
            //     ),
            //     placeholder: Image.asset('assets/images/loader_img.gif').image,
            //     image: Image(image: NetworkImage(video.thumbnailUrl)).image,
            //     placeholderErrorBuilder: (context, error, stackTrace) =>
            //         Image.asset('assets/images/error_img.png'),
            //   ),
            // ),

            CachedImageWidget(
              imageUrl: video.thumbnailUrl,
            ),
            SizedBox(height: 10.h),
            Text(
              video.title.trim(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ).paddingLeft(6).paddingRight(6),
            const SizedBox(height: 10),
            Text(
              video.description.trim(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
                color: Colors.white60,
              ),
            ).paddingLeft(6).paddingRight(6),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
