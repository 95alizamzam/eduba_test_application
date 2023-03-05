import 'package:eduba_test_app/features/videos/data/models/videos_model.dart';
import 'package:equatable/equatable.dart';

class FeedEntity extends Equatable {
  final String id, title;
  final List<VideoModel> videos;

  const FeedEntity({
    required this.id,
    required this.title,
    required this.videos,
  });

  @override
  List<Object?> get props => [id, title, videos];
}
