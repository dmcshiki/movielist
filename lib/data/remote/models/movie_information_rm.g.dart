// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_information_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieInformationRM _$MovieInformationRMFromJson(Map<String, dynamic> json) =>
    MovieInformationRM(
      title: json['original_title'] as String,
      image: json['poster_url'] as String,
      id: json['id'] as int,
      releaseDate: json['release_date'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      score: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieInformationRMToJson(MovieInformationRM instance) =>
    <String, dynamic>{
      'original_title': instance.title,
      'poster_url': instance.image,
      'id': instance.id,
      'release_date': instance.releaseDate,
      'genres': instance.genres,
      'vote_average': instance.score,
    };
