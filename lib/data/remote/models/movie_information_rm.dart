import 'package:json_annotation/json_annotation.dart';

part 'movie_information_rm.g.dart';

@JsonSerializable()
class MovieInformationRM {
  MovieInformationRM({
    required this.title,
    required this.image,
    required this.id,
    required this.releaseDate,
    required this.genres,
    required this.score,
  });

  factory MovieInformationRM.fromJson(Map<String, dynamic> json) =>
      _$MovieInformationRMFromJson(json);
  Map<String, dynamic> toJson() => _$MovieInformationRMToJson(this);

  @JsonKey(name: 'original_title')
  String title;

  @JsonKey(name: 'poster_url')
  String image;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'release_date')
  String releaseDate;

  @JsonKey(name: 'genres')
  List<String> genres;

  @JsonKey(name: 'vote_average')
  double score;
}
