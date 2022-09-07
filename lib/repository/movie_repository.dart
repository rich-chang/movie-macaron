import 'package:flutter_config/flutter_config.dart';
import 'package:dio/dio.dart';
import 'package:movie_macaron/model/movie_response.dart';

class MovieRepository {
  final String apiKey = FlutterConfig.get("TMDB_API_KEY");
  final Dio _dio = Dio();

  static String baseUrl = 'https://api.themoviedb.org/3';
  var getNowPlayingUrl = "$baseUrl/movie/now_playing";

  Future<MovieResponse> getNowPlaying() async {
    var params = {
      "api_key": apiKey,
      "language": "zh-TW",
      "page": 1,
    };
    try {
      Response response =
      await _dio.get(getNowPlayingUrl, queryParameters: params);
      print(MovieResponse.fromJson(response.data));
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace: $stackTrace");
      return MovieResponse.withError("$error");
    }
  }
}
