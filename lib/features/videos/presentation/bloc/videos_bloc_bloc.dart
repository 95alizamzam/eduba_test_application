import 'package:bloc/bloc.dart';
import 'package:eduba_test_app/features/videos/domain/entity/feed_entity.dart';
import 'package:equatable/equatable.dart';

import '../../domain/use_cases/get_videos_use_case.dart';

part 'videos_bloc_event.dart';
part 'videos_bloc_state.dart';

class VideosBlocBloc extends Bloc<VideosBlocEvent, VideosBlocState> {
  final GetVideosUseCase getVideosUseCase;
  VideosBlocBloc(this.getVideosUseCase) : super(VideosBlocInitial()) {
    on<VideosBlocEvent>((event, emit) async {
      if (event is GetVideoisEvent) {
        emit(VideosBlocLoadingState());
        final response = await getVideosUseCase.fetchVideos();
        response.fold(
          (l) => emit(VideosBlocFailedState(errorMsg: l.errorMsg)),
          (r) => emit(VideosBlocDoneState(videos: r)),
        );
      }
    });
  }
}
