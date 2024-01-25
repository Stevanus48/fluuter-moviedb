class Movie {
  Movie(
    this.id,
    this.title,
    this.voteAverage,
    this.releaseDate,
    this.overview,
    this.posterPath,
  );

  int? id; //untuk data "id" pada JSON
  String? title; //untuk data "title" pada JSON
  double? voteAverage; //untuk data "vote_average" pada JSON
  String? releaseDate; //untuk data "release_date" pada JSON
  String? overview; //untuk data "overview" pada JSON
  String? posterPath; //untuk data "poster_path" pada JSON

  Movie.fromJson(Map<String, dynamic> json) {
    //1
    id = json['id'] as int;
    title = json['title'];
    voteAverage = json['vote_average'] * 1.0 as double;
    releaseDate = json["release_date"];
    overview = json["overview"];
    posterPath = json["poster_path"];
  }
}
