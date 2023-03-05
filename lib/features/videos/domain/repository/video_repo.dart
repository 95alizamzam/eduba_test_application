import 'package:dartz/dartz.dart';
import 'package:eduba_test_app/core/network/network_exceptions_class.dart';
import 'package:eduba_test_app/features/videos/domain/entity/feed_entity.dart';

abstract class BaseVideoRepository {
  Future<Either<AppException, List<FeedEntity>>> fetchVideos();
}
