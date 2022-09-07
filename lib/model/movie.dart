class Movie {
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String poster;
  final String releaseDate;
  final String title;
  final int voteCount;
  final double rating;
  final String backPoster;

  Movie(
      this.id,
      this.popularity,
      this.title,
      this.backPoster,
      this.poster,
      this.overview,
      this.rating,
      this.originalLanguage,
      this.originalTitle,
      this.releaseDate,
      this.voteCount);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'].toDouble(),
        poster = json['poster_path'],
        releaseDate = json['release_date'],
        title = json['title'],
        voteCount = json['vote_count'],
        rating = json['vote_average'].toDouble(),
        backPoster = json['backdrop_path'];
}
