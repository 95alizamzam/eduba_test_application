import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final String uploadTime;
  final String views;
  final String author;
  final String videoUrl;
  final String description;
  final String subscriber;
  final bool isLive;

  const VideoEntity({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.uploadTime,
    required this.views,
    required this.author,
    required this.videoUrl,
    required this.description,
    required this.subscriber,
    required this.isLive,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        thumbnailUrl,
        duration,
        uploadTime,
        views,
        author,
        videoUrl,
        description,
        subscriber,
        isLive
      ];
}
