import 'dart:convert';

class MovieRecommendationsModel {
  List<Movie> results;

  MovieRecommendationsModel({
    required this.results,
  });

  factory MovieRecommendationsModel.fromRawJson(String str) =>
      MovieRecommendationsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieRecommendationsModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationsModel(
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Movie {
  int id;
  String? posterPath;

  Movie({
    required this.id,
    required this.posterPath,
  });

  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "poster_path": posterPath,
      };
}
