import 'package:cached_network_image/cached_network_image.dart';
import 'package:movielist/common/movie_list_strings.dart';
import 'package:movielist/data/repository/movie_repository.dart';
import 'package:movielist/presentation/common/error_view.dart';
import 'package:movielist/presentation/common/loading_view.dart';
import 'package:movielist/presentation/model/movie_information.dart';
import 'package:flutter/material.dart';

enum ScreenStates { loading, success, error }

class MovieInformationScreen extends StatefulWidget {
  const MovieInformationScreen({required this.movieID, Key? key})
      : super(key: key);

  final String movieID;

  @override
  _MovieInformationScreenState createState() => _MovieInformationScreenState();
}

class _MovieInformationScreenState extends State<MovieInformationScreen> {
  ScreenStates state = ScreenStates.loading;
  late MovieInformation movieInformation;

  void getMovieInformation() {
    final repository = MovieRepository();
    setState(() {
      state = ScreenStates.loading;
    });

    repository.getMovieInformation(widget.movieID).then(
      (movie) {
        setState(() {
          movieInformation = movie;
          state = ScreenStates.success;
        });
      },
    ).catchError(
      (_) {
        setState(
          () {
            state = ScreenStates.error;
          },
        );
      },
    );
  }

  @override
  void initState() {
    getMovieInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(MovieListStrings.movieInformationScreenTitle),
        backgroundColor: Colors.black,
      ),
      body: state == ScreenStates.loading
          ? const LoadingView()
          : state == ScreenStates.success
              ? MovieInformationView(movieInformation: movieInformation)
              : ErrorView(onTryAgain: getMovieInformation));
}

class MovieInformationView extends StatelessWidget {
  const MovieInformationView({
    required this.movieInformation,
    Key? key,
  }) : super(key: key);

  final MovieInformation movieInformation;

  @override
  Widget build(BuildContext context) {
    final movieFields = [
      [
        MovieListStrings.movieInformationScreenTitleLabel,
        movieInformation.title
      ],
      [
        MovieListStrings.movieInformationScreenScoreLabel,
        movieInformation.score
      ],
      [
        MovieListStrings.movieInformationScreenReleaseLabel,
        movieInformation.releaseDate
      ],
      [
        MovieListStrings.movieInformationScreenGenresLabel,
        movieInformation.genres.join(', ')
      ]
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(96),
                child: CachedNetworkImage(
                  imageUrl: movieInformation.image,
                  width: 192,
                  height: 192,
                  errorWidget: (context, _, __) => Image.asset(
                    'lib/presentation/assets/movieCatch.jpg',
                    scale: 0.5,
                    height: 96,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            ...movieFields.map(
              (movieInfo) => Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: movieInfo[0],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: movieInfo[1],
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
