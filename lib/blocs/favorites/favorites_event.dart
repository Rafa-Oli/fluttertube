import 'package:equatable/equatable.dart';

import '../../models/video.dart';

abstract class FavoritesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoritesGettingEvent extends FavoritesEvent {
  FavoritesGettingEvent();
}

class FavoritesToggleEvent extends FavoritesEvent {
  final Video video;

  FavoritesToggleEvent({
    required this.video,
  });

  @override
  List<Object?> get props => [video];
}
