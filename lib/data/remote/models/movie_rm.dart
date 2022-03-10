import 'package:json_annotation/json_annotation.dart';

part 'movie_rm.g.dart';

@JsonSerializable()
class MovieRM {
  MovieRM({
    required this.title,
    required this.image,
    required this.id,
  });

  factory MovieRM.fromJson(Map<String, dynamic> json) =>
      _$MovieRMFromJson(json);
  Map<String, dynamic> toJson() => _$MovieRMToJson(this);

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'poster_url')
  String image;

  @JsonKey(name: 'id')
  int id;
}
