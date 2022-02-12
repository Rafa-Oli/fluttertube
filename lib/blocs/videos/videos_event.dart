import 'package:equatable/equatable.dart';

abstract class VideosEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class VideosGetEvent extends VideosEvent {
  VideosGetEvent();

  @override
  List<Object?> get props => [];
}
