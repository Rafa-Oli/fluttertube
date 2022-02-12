import 'package:flutter/material.dart';
import 'package:fluttertube/models/video.dart';

class VideoTile extends StatelessWidget {
  final Video video;
  // late final blocFavorite;
  VideoTile(this.video);
  @override
  Widget build(BuildContext context) {
    // blocFavorite = BlocProvider.getBloc<FavoriteBloc>();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(
              video.thumb,
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
                        video.title,
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
                        video.channel,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // StreamBuilder<Map<String, Video>>(
              //     stream: blocFavorite.outFav,
              //     initialData: {},
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return IconButton(
              //           icon: Icon(snapshot.data!.containsKey(video.id)
              //               ? Icons.star
              //               : Icons.star_border),
              //           color: Colors.white,
              //           iconSize: 30,
              //           onPressed: () {
              //             blocFavorite.toggleFavorite(video);
              //           },
              //         );
              //       } else {
              //         return CircularProgressIndicator();
              //       }
              //     })
            ],
          )
        ],
      ),
    );
  }
}
