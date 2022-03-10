import 'package:dio/dio.dart';
import 'package:movielist/data/remote/models/movie_information_rm.dart';
import 'package:movielist/data/remote/models/movie_rm.dart';

class MovieRDS {
  final _baseURL = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';
  final dio = Dio()
    ..interceptors.add(
      LogInterceptor(
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          // ignore: dead_code
          logPrint: false ? (_) {} : print),
    );

  Future<List<MovieRM>> getMovies() => dio
      .get(
        _baseURL,
      )
      .then(
        (response) => List<MovieRM>.from(
          response.data.map(
            (sourceResult) => MovieRM.fromJson(sourceResult),
          ),
        ),
      );

  Future<MovieInformationRM> getMovieInformation(String movieID) => dio
      .get(
        '$_baseURL/$movieID',
      )
      .then(
        (response) => MovieInformationRM.fromJson(
          response.data,
        ),
      );
}
