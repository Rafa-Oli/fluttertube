import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertube/blocs/videos/videos_event.dart';
import 'package:fluttertube/blocs/videos/videos_state.dart';
import 'package:fluttertube/delegates/data_search.dart';
import 'package:fluttertube/models/video.dart';

import 'package:fluttertube/screens/favorites.dart';
import 'package:fluttertube/widgets/video_tile.dart';

import '../blocs/videos/videos_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.getBloc<VideosBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset('images/PngItem_5088909.png'),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: [
          Align(
            alignment: Alignment.center,
            // child: StreamBuilder<Map<String, Video>>(
            //   stream: BlocProvider.getBloc<FavoriteBloc>().outFav,
            //   initialData: {},
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData)
            //       return Text('${snapshot.data!.length}');
            //     else
            //       return Container();
            //   },
            // ),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Favorites()));
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String? result = await showSearch(
                context: context,
                delegate: DataSearch(),
              );
              // if (result != null) bloc.inSearch.add(result);
            },
          ),
        ],
      ),
      backgroundColor: Colors.black87,
      body: const Videos(),

      // body: StreamBuilder(
      //   stream: bloc.outVideos,
      //   initialData: [],
      //   builder: (context, AsyncSnapshot<dynamic> snapshot) {
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //         itemBuilder: (context, index) {
      //           if (index < snapshot.data.length) {
      //             return VideoTile(snapshot.data[index]);
      //           } else if (index > 1) {
      //             bloc.inSearch.add('');
      //             return Container(
      //               height: 40,
      //               width: 40,
      //               alignment: Alignment.center,
      //               child: CircularProgressIndicator(
      //                 valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      //               ),
      //             );
      //           } else {
      //             return Container();
      //           }
      //         },
      //         itemCount: snapshot.data.length + 1,
      //       );
      //     } else
      //       return Container();
      //   },
      // ),
    );
  }
}

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  late VideosBloc _videosBloc;
  late final _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _videosBloc.add(VideosGetEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    _videosBloc = BlocProvider.of<VideosBloc>(context);
    _controller = ScrollController();

    return Scaffold(
      body: BlocConsumer<VideosBloc, VideosState>(
        bloc: _videosBloc,
        builder: (context, state) {
          if (state is InitialValues || state is VideosGetting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is VideosGettingSuccess) {
            return VideoTile(state.videos[0]);
            // print(state);
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
    );
  }
}
