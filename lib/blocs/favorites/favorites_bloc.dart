import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertube/blocs/favorites/favorites_event.dart';
import 'package:fluttertube/blocs/favorites/favorites_state.dart';
import 'package:fluttertube/models/video.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  Map<String, Video> _favorites = {};
  FavoritesBloc() : super(InitialValues()) {
    on<FavoritesToggleEvent>(_toggleFavorite);
  }

  void _toggleFavorite(
      FavoritesToggleEvent event, Emitter<FavoritesState> emitter) async {}
}
