import 'package:rxdart/rxdart.dart';
import 'package:movie_macaron/repository/movie_repository.dart';
import 'package:movie_macaron/model/movie_response.dart';

class NowPlayingListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  //Observable
  // TODO:
  BehaviorSubject<MovieResponse> get subject => _subject;

  void getMovie() async {
    MovieResponse response = await _repository.getNowPlaying();
    _subject.sink.add(response);
  }

  void dispose(){
    _subject.close();
  }
}

final nowPlayingMoviesBloc = NowPlayingListBloc();