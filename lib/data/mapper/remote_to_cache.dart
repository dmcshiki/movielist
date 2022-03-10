import 'package:movielist/data/cache/models/movie_cm.dart';
import 'package:movielist/data/cache/models/movie_information_cm.dart';
import 'package:movielist/data/remote/models/movie_information_rm.dart';
import 'package:movielist/data/remote/models/movie_rm.dart';

extension MovieRMMapper on MovieRM {
  MovieCM toCacheModel() => MovieCM(
        title: title,
        image: image,
        id: id.toString(),
      );
}

extension MovieInformationRMMapper on MovieInformationRM {
  MovieInformationCM toCacheModel() => MovieInformationCM(
        title: title,
        image: image,
        id: id.toString(),
        genres: genres,
        score: score.toString(),
        releaseDate: releaseDate,
      );
}
