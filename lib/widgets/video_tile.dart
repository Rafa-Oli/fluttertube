import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertube/models/video.dart';

import '../blocs/favorites/favorites_bloc.dart';
import '../blocs/favorites/favorites_event.dart';
import '../blocs/favorites/favorites_state.dart';

class VideoTile extends StatefulWidget {
  final Video video;
  VideoTile(this.video);

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late FavoritesBloc _favoritesBloc;
  late final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _favoritesBloc.add(FavoritesGettingEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    _favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(
              widget.video.thumb,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        widget.video.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        widget.video.channel,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<FavoritesBloc, FavoritesState>(
                bloc: _favoritesBloc,
                builder: (context, state) {
                  if (state is InitialValues || state is FavoritesGetting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is FavoritesGettingSuccess) {
                    return IconButton(
                      icon: Icon(state.videos.containsKey(widget.video.id)
                          ? Icons.star
                          : Icons.star_border),
                      color: Colors.black,
                      iconSize: 30,
                      onPressed: () {
                        _favoritesBloc
                            .add(FavoritesToggleEvent(video: widget.video));
                      },
                    );
                  }

                  return const Center(
                    child: Text('Algo inesperado ocorreu'),
                  );
                },
                listener: (context, state) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    if (_controller.hasClients) {
                      _controller.animateTo(
                        _controller.position.maxScrollExtent,
                        duration: kThemeAnimationDuration,
                        curve: Curves.easeOut,
                      );
                    }
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
