import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertube/blocs/videos_bloc.dart';
import 'package:fluttertube/delegates/data_search.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/widgets/video_tile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<VideosBloc>();
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
            child: Text('0'),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String? result = await showSearch(
                context: context,
                delegate: DataSearch(),
              );
              if (result != null) bloc.inSearch.add(result);
            },
          ),
        ],
      ),
      backgroundColor: Colors.black87,
      body: StreamBuilder(
        stream: bloc.outVideos,
        initialData: [],
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index < snapshot.data.length) {
                  return VideoTile(snapshot.data[index]);
                } else if (index > 1) {
                  bloc.inSearch.add('');
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  );
                } else {
                  return Container();
                }
              },
              itemCount: snapshot.data.length + 1,
            );
          } else
            return Container();
        },
      ),
    );
  }
}
