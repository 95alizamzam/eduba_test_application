import 'package:eduba_test_app/features/videos/domain/entity/video_entity.dart';

class VideoModel extends VideoEntity {
  const VideoModel({
    required super.id,
    required super.title,
    required super.thumbnailUrl,
    required super.videoUrl,
    required super.description,
    required super.duration,
    required super.uploadTime,
    required super.views,
    required super.author,
    required super.subscriber,
    required super.isLive,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
      videoUrl: json['videoUrl'],
      description: json['description'],
      duration: json['duration'],
      author: json['author'],
      isLive: json['isLive'],
      subscriber: json['subscriber'],
      uploadTime: json['uploadTime'],
      views: json['views'],
    );
  }
}
