import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertube/api.dart';
import 'package:fluttertube/blocs/videos/videos_event.dart';
import 'package:fluttertube/blocs/videos/videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final Api api;

  VideosBloc({required this.api}) : super(InitialValues()) {
    on<VideosGetEvent>(_getVideos);
  }

  FutureOr<void> _getVideos(
      VideosGetEvent event, Emitter<VideosState> emitter) async {
    emitter(VideosGetting());
    try {
      final videos = await api.get();
      emitter(VideosGettingSuccess(videos: videos));
    } catch (e) {}
  }
}
