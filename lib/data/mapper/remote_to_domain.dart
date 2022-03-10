import 'package:movielist/data/remote/models/movie_information_rm.dart';
import 'package:movielist/data/remote/models/movie_rm.dart';
import 'package:movielist/presentation/model/movie_information.dart';
import 'package:movielist/presentation/model/movie_list.dart';

extension MovieRMMapper on MovieRM {
  Movie toDomainModel() => Movie(
        title: title,
        image: image,
        id: id.toString(),
      );
}

extension MovieInformationRMMapper on MovieInformationRM {
  MovieInformation toDomainModel() => MovieInformation(
        title: title,
        image: image,
        id: id.toString(),
        genres: genres,
        score: score.toString(),
        releaseDate: releaseDate,
      );
}
