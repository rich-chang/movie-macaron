import 'package:flutter/material.dart';
import 'package:movie_macaron/bloc/get_now_playing_bloc.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({required Key key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nowPlayingMoviesBloc.getMovie();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}