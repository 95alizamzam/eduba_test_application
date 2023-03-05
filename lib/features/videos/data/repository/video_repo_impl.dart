import 'package:eduba_test_app/features/videos/domain/entity/feed_entity.dart';
import 'package:eduba_test_app/core/network/network_exceptions_class.dart';
import 'package:dartz/dartz.dart';
import 'package:eduba_test_app/features/videos/domain/repository/video_repo.dart';

import '../data_source/remote_data_source.dart';

class VideoRepositoryImpl implements BaseVideoRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  VideoRepositoryImpl(this.baseRemoteDataSource);
  @override
  Future<Either<AppException, List<FeedEntity>>> fetchVideos() async {
    return await baseRemoteDataSource.fetchVideos();
  }
}
