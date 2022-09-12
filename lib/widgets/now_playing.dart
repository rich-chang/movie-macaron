import 'package:flutter/material.dart';
import 'package:movie_macaron/bloc/get_now_playing_bloc.dart';
import 'package:movie_macaron/model/movie_response.dart';
import 'package:movie_macaron/model/movie.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

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
    return StreamBuilder<MovieResponse> (
      stream: nowPlayingMoviesBloc.movieObservable,
      builder: (BuildContext context, AsyncSnapshot<MovieResponse> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error as String);
        } else if (snapshot.hasData) {
          if (snapshot.data!.error.isNotEmpty) {
            return _buildErrorWidget(snapshot.data!.error);
          }
          return _buildNowPlayingWidget(snapshot.data!);
        } else {
          return _buildLoadingWidget();
        }

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('没有Stream');
          case ConnectionState.waiting:
            return Text('等待数据...');
          case ConnectionState.active:
            return Text('active: ${snapshot.data}');
          case ConnectionState.done:
            return Text('Stream 已关闭');
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return const Text(" <Now Playing> is loading ...");
  }

  Widget _buildErrorWidget(String errorMsg) {
    return Text(errorMsg);
  }

  Widget _buildNowPlayingWidget(MovieResponse data) {
    List<Movie> movies = data.movies;
    if (movies.isEmpty) {
      return const Text("No movies");
    } else {
      for (int i=0;i<movies.length;i++) {
        print(movies[i].title);
      }
      return const Text("Now Playing movies");
    }
  }

}