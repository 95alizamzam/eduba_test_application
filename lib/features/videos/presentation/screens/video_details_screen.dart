import 'dart:developer';

import 'package:eduba_test_app/core/colors/app_colors.dart';
import 'package:eduba_test_app/core/extensions/extensions.dart';
import 'package:eduba_test_app/features/videos/presentation/widgets/statistics_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../domain/entity/video_entity.dart';

import 'dart:io' show Platform;

class VideoDetailsScreen extends StatefulWidget {
  const VideoDetailsScreen({super.key, required this.videoDetails});
  final VideoEntity videoDetails;

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  late VideoPlayerController _controller;
  String videoFullDuration = '0:0';
  String currentValue = '0:0';
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();

    log(widget.videoDetails.videoUrl);
    _controller =
        VideoPlayerController.network(widget.videoDetails.videoUrl.trim())
          ..initialize().then((_) {
            _controller.play();
            setState(() {});
            log('my video duration >>>>>> ${_controller.value.duration}');
            log('my video duration in minutes >>>>>> ${_controller.value.duration.inMinutes % 60}');
            log('my video duration in seconds >>>>>> ${_controller.value.duration.inSeconds % 60}');
          });
    _controller.setVolume(1.0);

    _controller.addListener(() {
      videoFullDuration =
          '${_controller.value.duration.inMinutes}:${_controller.value.duration.inSeconds % 60}';
      currentValue =
          '${_controller.value.position.inMinutes}:${_controller.value.position.inSeconds % 60}';

      progressValue = _controller.value.position.inSeconds /
          _controller.value.duration.inSeconds;
      setState(() {});

      log('video current position >>>> ${_controller.value.position}');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: Platform.isIOS ? true : false,
        centerTitle: true,
        title: Text(
          widget.videoDetails.title,
          style: TextStyle(fontSize: 14.sp),
        ),
        // actions: [
        //   CircleAvatar(
        //     radius: 20,
        //     backgroundColor: black,
        //     backgroundImage: NetworkImage(
        //       widget.videoDetails.thumbnailUrl,
        //     ),
        //   ),
        //   SizedBox(width: 10.w),
        // ],
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();

                      setState(() {});
                    },
                    onDoubleTap: () {
                      _controller.seekTo(Duration(
                        seconds: _controller.value.position.inSeconds + 10,
                      ));
                      setState(() {});
                    },
                    child: SizedBox(
                      height: 300,
                      width: double.maxFinite,
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : const CircularProgressIndicator(color: red)
                              .center(),
                    ),
                  ),
                  if (!_controller.value.isPlaying &&
                      _controller.value.isInitialized)
                    IconButton(
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 40,
                        color: red,
                      ),
                      onPressed: () {
                        _controller.play();
                        setState(() {});
                      },
                    ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(seconds: 1),
                      tween: Tween(begin: 0, end: progressValue),
                      builder: (__, value, _) => LinearProgressIndicator(
                        color: red,
                        value: value,
                        backgroundColor: black,
                        minHeight: 3,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 8,
                    child: Text(
                      videoFullDuration,
                      style: const TextStyle(
                        color: white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    left: 8,
                    child: Text(
                      currentValue,
                      style: const TextStyle(
                        color: white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  if (widget.videoDetails.isLive)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: SizedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.green,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'Live Now',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: red,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                widget.videoDetails.title.trim(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ).paddingLeft(6).paddingRight(6),
              SizedBox(height: 10.h),
              Text(
                widget.videoDetails.description.trim(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white60,
                ),
              ).paddingLeft(6).paddingRight(6),
              SizedBox(height: 30.h),
              SizedBox(
                child: Row(
                  children: [
                    StatisticsItem(
                      label: 'views',
                      value: widget.videoDetails.views,
                    ),
                    Container(
                      height: 50,
                      width: 2,
                      color: red,
                    ),
                    StatisticsItem(
                      label: 'The Author',
                      value: widget.videoDetails.author,
                    ),
                    Container(
                      height: 50,
                      width: 2,
                      color: red,
                    ),
                    StatisticsItem(
                      label: 'subscribers',
                      value: widget.videoDetails.subscriber
                          .split(' ')
                          .first
                          .trim(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
