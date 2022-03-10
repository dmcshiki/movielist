// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRM _$MovieRMFromJson(Map<String, dynamic> json) => MovieRM(
      title: json['title'] as String,
      image: json['poster_url'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$MovieRMToJson(MovieRM instance) => <String, dynamic>{
      'title': instance.title,
      'poster_url': instance.image,
      'id': instance.id,
    };
