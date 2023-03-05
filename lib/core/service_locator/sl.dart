import 'package:eduba_test_app/core/navigation/navigation_services.dart';
import 'package:eduba_test_app/core/network/http_class.dart';
import 'package:get_it/get_it.dart';

import '../../features/videos/data/data_source/remote_data_source.dart';
import '../../features/videos/data/repository/video_repo_impl.dart';
import '../../features/videos/domain/repository/video_repo.dart';
import '../../features/videos/domain/use_cases/get_videos_use_case.dart';
import '../../features/videos/presentation/bloc/videos_bloc_bloc.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton<HttpClass>(() => HttpClass());
  sl.registerLazySingleton<CheckInternetClass>(() => CheckInternetClass());
  sl.registerLazySingleton<NavigationServices>(() => NavigationServices());

  sl.registerFactory<VideosBlocBloc>(() => VideosBlocBloc(sl()));

  sl.registerLazySingleton<GetVideosUseCase>(() => GetVideosUseCase(sl()));

  sl.registerLazySingleton<BaseVideoRepository>(
      () => VideoRepositoryImpl(sl()));

  sl.registerLazySingleton<BaseRemoteDataSource>(
      () => RemoteDataSourceWithHttp());
}
