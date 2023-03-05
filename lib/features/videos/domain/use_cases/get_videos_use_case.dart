import 'package:dartz/dartz.dart';
import 'package:eduba_test_app/features/videos/domain/entity/feed_entity.dart';
import 'package:eduba_test_app/features/videos/domain/repository/video_repo.dart';

import '../../../../core/network/network_exceptions_class.dart';

class GetVideosUseCase {
  final BaseVideoRepository repo;
  GetVideosUseCase(this.repo);

  Future<Either<AppException, List<FeedEntity>>> fetchVideos() async {
    return await repo.fetchVideos();
  }
}
