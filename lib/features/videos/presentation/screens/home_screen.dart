import 'dart:async';

import 'package:eduba_test_app/core/extensions/extensions.dart';
import 'package:eduba_test_app/features/videos/domain/entity/video_entity.dart';
import 'package:eduba_test_app/features/videos/presentation/bloc/videos_bloc_bloc.dart';
import 'package:eduba_test_app/features/videos/presentation/screens/search_screen.dart';
import 'package:eduba_test_app/features/videos/presentation/widgets/home_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/navigation/navigation_services.dart';
import '../../../../core/service_locator/sl.dart';
import '../../domain/entity/feed_entity.dart';
import '../widgets/error_widget.dart';
import '../widgets/item_shape.dart';
import '../widgets/search_field.dart';
import '../widgets/view_all_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late List<FeedEntity> data;
  late List<VideoEntity> allVideosFromAllTypes = [];

  List<VideoEntity> trendVideos = [];
  List<VideoEntity> topRatedvideos = [];
  List<VideoEntity> recentVideos = [];
  bool isGridShape = true;

  bool isSearchEnabled = false;
  final StreamController<String> sc = StreamController();

  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<VideosBlocBloc>(context).add(const GetVideoisEvent());
  }

  void filterVideos(List<FeedEntity> data) {
    for (FeedEntity element in data) {
      if (element.id == 'trend') {
        trendVideos.addAll(element.videos);
      } else if (element.id == 'top_rated') {
        topRatedvideos.addAll(element.videos);
      } else {
        recentVideos.addAll(element.videos);
      }

      allVideosFromAllTypes.addAll(element.videos);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Eduba'),
      ),
      body: BlocConsumer<VideosBlocBloc, VideosBlocState>(
        listener: (context, state) {
          if (state is VideosBlocDoneState) {
            data = state.videos;
            filterVideos(data);
          }
        },
        builder: (context, state) {
          if (state is VideosBlocLoadingState || state is VideosBlocInitial) {
            return const HomeScreenLoader();
          }

          if (state is VideosBlocFailedState) {
            return ErrorShapeWidget(
              errorMsg: state.errorMsg.trim(),
              onTap: () {
                BlocProvider.of<VideosBlocBloc>(context)
                    .add(const GetVideoisEvent());
              },
            ).center();
          }
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  SearchField(
                    onTap: () {
                      sl<NavigationServices>().goTo(
                        context: context,
                        targetScreen: SearchScreen(
                          videos: allVideosFromAllTypes,
                        ),
                      );
                    },
                    controller: controller,
                    onChange: (String text) {},
                  ),
                  SizedBox(height: 10.h),
                  const ViewAllRow(label: 'Trends'),
                  SizedBox(
                    height: 200.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ItemShape(video: trendVideos[index]);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 20.w),
                      itemCount: trendVideos.length,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const ViewAllRow(label: 'Top Rated '),
                  SizedBox(
                    height: 200.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ItemShape(video: topRatedvideos[index]);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 20.sp),
                      itemCount: topRatedvideos.length,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const ViewAllRow(label: 'Recent Added'),
                  SizedBox(
                    height: 200.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ItemShape(video: recentVideos[index]);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 20.w),
                      itemCount: recentVideos.length,
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
