import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List movies = [];
  List topratedMovies = [];
  List tvShows = [];
  final String apiKey = 'c967332f512d6aa525457773bb53d406';
  final readaccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOTY3MzMyZjUxMmQ2YWE1MjU0NTc3NzNiYjUzZDQwNiIsIm5iZiI6MTc0OTIwMTAxNy42OTcsInN1YiI6IjY4NDJiMDc5MDlhOTkwMWRjMTFiMDU4ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Z9vI8hBhPM1zlEzF7ruFke0LKW0EEnArDQeSQl9FJ7c';

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdb = TMDB(
      ApiKeys(apiKey, readaccessToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendingResult = await tmdb.v3.trending.getTrending();

    Map toprated = await tmdb.v3.movies.getTopRated();
    Map tv = await tmdb.v3.tv.getPopular();
    setState(() {
      movies = trendingResult['results'];
      topratedMovies = toprated['results'];
      tvShows = tv['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: TextModified(text: "IMDB Movie App ❤️", size: 26),
      ),
      body: ListView(children: [TrendingMovies(trending: movies)]),
    );
  }
}
