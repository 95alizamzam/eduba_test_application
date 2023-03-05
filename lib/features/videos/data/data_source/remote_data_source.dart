import 'package:dartz/dartz.dart';
import 'package:eduba_test_app/core/network/http_class.dart';
import 'package:eduba_test_app/core/network/network_exceptions_class.dart';
import 'package:eduba_test_app/core/service_locator/sl.dart';
import 'package:eduba_test_app/features/videos/data/models/feed_model.dart';

abstract class BaseRemoteDataSource {
  Future<Either<AppException, List<FeedModel>>> fetchVideos();
}

class RemoteDataSourceWithHttp implements BaseRemoteDataSource {
  @override
  Future<Either<AppException, List<FeedModel>>> fetchVideos() async {
    try {
      final response = await sl<HttpClass>().get(endPoint: '/videos.json');

      final List<FeedModel> data = List.from(response['feed']).map((data) {
        return FeedModel.fromJson(data);
      }).toList();

      return Right(data);
    } on AppException catch (e) {
      return left(e);
    }
  }
}
