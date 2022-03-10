import 'package:hive/hive.dart';

part 'movie_cm.g.dart';

@HiveType(typeId: 0)
class MovieCM {
  MovieCM({
    required this.title,
    required this.image,
    required this.id,
  });

  @HiveField(0)
  String title;

  @HiveField(1)
  String image;

  @HiveField(2)
  String id;
}
