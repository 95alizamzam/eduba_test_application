part of 'videos_bloc_bloc.dart';

abstract class VideosBlocEvent extends Equatable {
  const VideosBlocEvent();
  @override
  List<Object> get props => [];
}

class GetVideoisEvent extends VideosBlocEvent {
  const GetVideoisEvent();
}
