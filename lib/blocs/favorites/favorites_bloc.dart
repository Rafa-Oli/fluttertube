import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertube/blocs/favorites/favorites_event.dart';
import 'package:fluttertube/blocs/favorites/favorites_state.dart';
import 'package:fluttertube/models/video.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  Map<String, Video> _favorites = {};

  FavoritesBloc() : super(InitialValues()) {
    on<FavoritesToggleEvent>(_toggleFavorite);
    on<FavoritesGettingEvent>(_getFavorites);
  }

  void _getFavorites(
      FavoritesGettingEvent event, Emitter<FavoritesState> emitter) async {
    emitter(FavoritesGetting());
    try {
      SharedPreferences.getInstance().then((value) {
        if (value.getKeys().contains("favorites")) {
          _favorites = jsonDecode(value.getString("favorites") as String)
              .map((key, value) {
            return MapEntry(key, Video.fromJson(value));
          }).cast<String, Video>();
        }
      });

      emitter(FavoritesGettingSuccess(videos: _favorites));

      _saveFav();
    } catch (e) {}
  }

  void _toggleFavorite(
      FavoritesToggleEvent event, Emitter<FavoritesState> emitter) async {
    if (_favorites.containsKey(event.video.id))
      _favorites.remove(event.video.id);
    else
      _favorites[event.video.id] = event.video;

    _saveFav();

    emitter(FavoritesGettingSuccess(videos: _favorites));
  }

  void _saveFav() {
    SharedPreferences.getInstance().then(
        (prefs) => {prefs.setString("favorites", json.encode(_favorites))});
  }
}
