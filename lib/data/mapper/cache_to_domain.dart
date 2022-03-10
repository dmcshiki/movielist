import 'package:movielist/data/cache/models/movie_cm.dart';
import 'package:movielist/data/cache/models/movie_information_cm.dart';
import 'package:movielist/presentation/model/movie_information.dart';
import 'package:movielist/presentation/model/movie_list.dart';

extension MovieCMMapper on MovieCM {
  Movie toDomainModel() => Movie(
        title: title,
        image: image,
        id: id,
      );
}

extension MovieInformationCMMapper on MovieInformationCM {
  MovieInformation toDomainModel() => MovieInformation(
        title: title,
        image: image,
        id: id,
        releaseDate: releaseDate,
        genres: genres,
        score: score.toString(),
      );
}
