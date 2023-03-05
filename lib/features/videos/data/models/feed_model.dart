import 'package:eduba_test_app/features/videos/data/models/videos_model.dart';
import 'package:eduba_test_app/features/videos/domain/entity/feed_entity.dart';

class FeedModel extends FeedEntity {
  const FeedModel({
    required super.id,
    required super.title,
    required super.videos,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      id: json['id'],
      title: json['title'],
      videos: List.from(json['items']).map((video) {
        return VideoModel.fromJson(video);
      }).toList(),
    );
  }
}
