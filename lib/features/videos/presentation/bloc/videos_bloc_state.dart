part of 'videos_bloc_bloc.dart';

abstract class VideosBlocState extends Equatable {
  const VideosBlocState();

  @override
  List<Object> get props => [];
}

class VideosBlocInitial extends VideosBlocState {}

class VideosBlocLoadingState extends VideosBlocState {}

class VideosBlocDoneState extends VideosBlocState {
  final List<FeedEntity> videos;
  @override
  List<Object> get props => [videos];
  const VideosBlocDoneState({required this.videos});
}

class VideosBlocFailedState extends VideosBlocState {
  final String errorMsg;

  @override
  List<Object> get props => [errorMsg];
  const VideosBlocFailedState({required this.errorMsg});
}
