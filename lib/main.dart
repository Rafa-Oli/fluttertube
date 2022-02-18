// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertube/api.dart';
import 'package:fluttertube/screens/home.dart';

import 'blocs/favorite_bloc.dart';
import 'blocs/videos/videos_bloc.dart';

void main() {
  Api api = Api();
  api.search("eletro");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VideosBloc(api: Api()),
        ),
      ],
      child: MaterialApp(
        title: 'FlutterTube',
        home: Home(),
      ),
    );
  }
}
