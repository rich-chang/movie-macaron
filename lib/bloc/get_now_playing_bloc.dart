import 'package:rxdart/rxdart.dart';
import 'package:movie_macaron/repository/movie_repository.dart';
import 'package:movie_macaron/model/movie_response.dart';

class NowPlayingListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subjectMovie = BehaviorSubject<MovieResponse>();

  // TODO: Observable (which extended from Stream) NOT used??? Use the Stream instead
  Stream<MovieResponse> get movieObservable => _subjectMovie.stream;

  // TODO: explicit to public class member
  BehaviorSubject<MovieResponse> get subject => _subjectMovie;

  void getMovie() async {
    MovieResponse response = await _repository.getNowPlaying();
    _subjectMovie.sink.add(response);
  }

  void dispose(){
    _subjectMovie.close();
  }
}

final nowPlayingMoviesBloc = NowPlayingListBloc();