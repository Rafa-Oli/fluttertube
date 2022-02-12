import 'package:equatable/equatable.dart';

import 'package:fluttertube/models/video.dart';

abstract class VideosState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialValues extends VideosState {}

class VideosGetting extends VideosState {}

// ignore: must_be_immutable
class VideosGettingSuccess extends VideosState {
  List<Video> videos;

  VideosGettingSuccess({required this.videos});

  @override
  List<Object?> get props => [videos];

  VideosGettingSuccess copyWith({
    List<Video>? videos,
  }) {
    return VideosGettingSuccess(
      videos: videos ?? this.videos,
    );
  }
}
