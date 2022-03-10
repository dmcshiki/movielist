import 'package:hive/hive.dart';

part 'movie_information_cm.g.dart';

@HiveType(typeId: 1)
class MovieInformationCM {
  MovieInformationCM({
    required this.title,
    required this.image,
    required this.id,
    required this.genres,
    required this.score,
    required this.releaseDate,
  });

  @HiveField(0)
  String title;

  @HiveField(1)
  String image;

  @HiveField(2)
  String id;

  @HiveField(3)
  List<String> genres;

  @HiveField(4)
  String score;

  @HiveField(5)
  String releaseDate;
}
