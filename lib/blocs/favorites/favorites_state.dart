import 'package:equatable/equatable.dart';

import '../../models/video.dart';

abstract class FavoritesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialValues extends FavoritesState {}

class FavoritesGetting extends FavoritesState {}

class FavoritesGettingSuccess extends FavoritesState {
  Map<String, Video> videos;

  FavoritesGettingSuccess({required this.videos});

  @override
  List<Object?> get props => [videos];

  FavoritesGettingSuccess copyWith({
    Map<String, Video>? videos,
  }) {
    return FavoritesGettingSuccess(
      videos: videos ?? this.videos,
    );
  }
}
