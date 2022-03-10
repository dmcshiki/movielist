import 'package:cached_network_image/cached_network_image.dart';
import 'package:movielist/common/movie_list_strings.dart';
import 'package:movielist/data/repository/movie_repository.dart';
import 'package:movielist/presentation/common/error_view.dart';
import 'package:movielist/presentation/common/loading_view.dart';
import 'package:movielist/presentation/model/movie_list.dart';
import 'package:movielist/presentation/screen/movie_information_screen.dart';
import 'package:flutter/material.dart';

enum ScreenStates { loading, success, error }

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  ScreenStates state = ScreenStates.loading;
  late List<Movie> movies;

  void getMovies() {
    setState(() {
      state = ScreenStates.loading;
    });

    final repository = MovieRepository();

    repository.getMovies().then(
      (movies) {
        setState(
          () {
            this.movies = movies;
            state = ScreenStates.success;
          },
        );
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
    super.initState();
    getMovies();
    //super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text(MovieListStrings.movieScreenTitle),
          backgroundColor: Colors.black,
        ),
        body: state == ScreenStates.loading
            ? const LoadingView()
            : state == ScreenStates.success
                ? GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 24,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (context, index) => ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF101010)),
                        elevation: MaterialStateProperty.all(8),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieInformationScreen(
                            movieID: movies[index].id,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: movies[index].image,
                                  height: 96,
                                  fit: BoxFit.fill,
                                  placeholder: (context, _) => Transform.scale(
                                    scale: 0.5,
                                    child: const CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, _, __) => Image.asset(
                                    'lib/presentation/assets/movieCatch.jpg',
                                    scale: 0.5,
                                    height: 96,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                height: 96,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.white12,
                                      Colors.white30
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              movies[index].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                overflow: TextOverflow.clip,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ErrorView(onTryAgain: getMovies),
      );
}
