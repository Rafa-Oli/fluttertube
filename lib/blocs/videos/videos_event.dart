import 'package:equatable/equatable.dart';

abstract class VideosEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class VideosGetEvent extends VideosEvent {
  VideosGetEvent();
}

class VideosGetSearchEvent extends VideosEvent {
  final String search;

  VideosGetSearchEvent({required this.search});
}
