import 'package:movielist/common/movie_list_strings.dart';
import 'package:movielist/data/cache/models/movie_cm.dart';
import 'package:movielist/data/cache/models/movie_information_cm.dart';
import 'package:movielist/presentation/screen/movie_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> _hiveInitializer() async {
  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter<MovieCM>(MovieCMAdapter())
    ..registerAdapter<MovieInformationCM>(MovieInformationCMAdapter());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _hiveInitializer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: MovieListStrings.appName,
        home: const MovieScreen(),
      );
}
