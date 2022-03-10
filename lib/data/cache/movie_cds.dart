import 'package:movielist/common/movie_list_strings.dart';
import 'package:movielist/data/cache/models/movie_cm.dart';
import 'package:movielist/data/cache/models/movie_information_cm.dart';
import 'package:hive/hive.dart';

class MovieCDS {
  static const _movieInformationBoxKey = 'movieInformation';
  static const _moviesBoxKey = 'movies';

  Future<List<MovieCM>> getMoviesFromCache() async {
    final box = await Hive.openBox<List>(_moviesBoxKey);
    final movies = box.getAt(0);
    if (movies != null) {
      return List<MovieCM>.from(movies);
    }
    throw Exception(MovieListStrings.movieCacheException);
  }

  Future<void> upsertMoviesToCache(List<MovieCM> movies) async {
    final box = await Hive.openBox<List>(_moviesBoxKey);

    return box.putAll({0: movies});
  }

  Future<MovieInformationCM> getMovieFromCache(String movieId) async {
    final box = await Hive.openBox<MovieInformationCM>(_movieInformationBoxKey);
    final movie = box.get(movieId);
    if (movie != null) {
      return movie;
    }
    throw Exception(MovieListStrings.movieCacheException);
  }

  Future<void> upsertMovieToCache(MovieInformationCM movie) async {
    final box = await Hive.openBox<MovieInformationCM>(_movieInformationBoxKey);

    return box.put(movie.id, movie);
  }

  void upsertDrinkToCache(cacheModel) {}
}
