import 'package:eduba_test_app/core/colors/app_colors.dart';
import 'package:eduba_test_app/core/extensions/extensions.dart';
import 'package:eduba_test_app/core/navigation/navigation_services.dart';
import 'package:eduba_test_app/core/service_locator/sl.dart';
import 'package:eduba_test_app/features/videos/domain/entity/video_entity.dart';
import 'package:eduba_test_app/features/videos/presentation/screens/video_details_screen.dart';
import 'package:eduba_test_app/features/videos/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:io' show Platform;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.videos});
  final List<VideoEntity> videos;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  List<VideoEntity> filteredVideos = [];
  final FocusNode node = FocusNode();

  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      filteredVideos = [];
      final String query = controller.text.trim().toLowerCase();

      if (query.isEmpty) {
        filteredVideos.clear();
        setState(() {});
      }
      //if (query.length >= 4)
      else {
        for (var element in widget.videos) {
          if (element.title.toLowerCase().contains(query)) {
            if (!filteredVideos.contains(element)) {
              filteredVideos.add(element);
            }
          }
        }
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Search'),
          automaticallyImplyLeading: Platform.isIOS ? true : false,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              SearchField(
                controller: controller,
                node: node,
                onChange: (String text) {},
              ),
              SizedBox(height: 20.h),
              filteredVideos.isEmpty
                  ? Text(
                      'No results Found',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ).center()
                  : Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: filteredVideos.length,
                        separatorBuilder: (context, index) => Divider(
                          color: white.withOpacity(.3),
                        ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              onTap(filteredVideos[index]);
                            },
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              backgroundImage: FadeInImage(
                                fit: BoxFit.fill,
                                placeholder: const AssetImage(
                                    'assets/images/loader_img.gif'),
                                image: NetworkImage(
                                  filteredVideos[index].thumbnailUrl,
                                ),
                                placeholderErrorBuilder: (context, error,
                                        stackTrace) =>
                                    Image.asset('assets/images/loader_img.gif'),
                                imageErrorBuilder: (c, e, s) =>
                                    Image.asset('assets/images/loader_img.gif'),
                              ).image,
                            ),
                            title: Text(
                              filteredVideos[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              filteredVideos[index].description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.normal,
                                color: white.withOpacity(.6),
                              ),
                            ),
                            trailing: filteredVideos[index].isLive
                                ? const CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.green,
                                  )
                                : const SizedBox.shrink(),
                            dense: true,
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void onTap(VideoEntity videoDetails) {
    FocusScope.of(context).unfocus();
    sl<NavigationServices>().goTo(
      context: context,
      targetScreen: VideoDetailsScreen(videoDetails: videoDetails),
    );
  }
}
