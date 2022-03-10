import 'package:movielist/data/cache/movie_cds.dart';
import 'package:movielist/data/mapper/cache_to_domain.dart';
import 'package:movielist/data/mapper/remote_to_cache.dart';
import 'package:movielist/data/mapper/remote_to_domain.dart';
import 'package:movielist/data/remote/movie_rds.dart';
import 'package:movielist/presentation/model/movie_information.dart';
import 'package:movielist/presentation/model/movie_list.dart';

class MovieRepository {
  MovieRepository();

  final MovieRDS rds = MovieRDS();
  final MovieCDS cds = MovieCDS();

  Future<List<Movie>> getMovies() => rds.getMovies().then((
        movies,
      ) {
        cds.upsertMoviesToCache(
          movies
              .map(
                (
                  movie,
                ) =>
                    movie.toCacheModel(),
              )
              .toList(),
        );
        return movies
            .map(
              (movie) => movie.toDomainModel(),
            )
            .toList();
      }).catchError(
        (_) => cds.getMoviesFromCache().then(
              (movies) => movies
                  .map(
                    (movies) => movies.toDomainModel(),
                  )
                  .toList(),
            ),
      );

  Future<MovieInformation> getMovieInformation(String movieID) =>
      rds.getMovieInformation(movieID).then(
        (movie) {
          cds.upsertMovieToCache(
            movie.toCacheModel(),
          );
          return movie.toDomainModel();
        },
      ).catchError(
        (_) => cds.getMovieFromCache(movieID).then(
              (movie) => movie.toDomainModel(),
            ),
      );
}
