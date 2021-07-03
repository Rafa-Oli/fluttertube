// @dart=2.9
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertube/api.dart';
import 'package:fluttertube/screens/home.dart';

import 'blocs/videos_bloc.dart';

void main() {
  Api api = Api();
  api.search("eletro");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [Bloc((i) => VideosBloc())],
        dependencies: [],
        child: MaterialApp(
          title: 'FlutteTube',
          home: Home(),
        ));
  }
}
