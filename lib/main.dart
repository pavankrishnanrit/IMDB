import 'package:flutter/material.dart';
import 'package:imdb/utils/text.dart';
import 'package:imdb/widgets/topRated.dart';
import 'package:imdb/widgets/trending.dart';
import 'package:imdb/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.blue[900]),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final String apiKey = 'f9ab46ea2095ad3b3f85cba846cc3bef';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWFiNDZlYTIwOTVhZDNiM2Y4NWNiYTg0NmNjM2JlZiIsInN1YiI6IjYxM2I4MDIzZDRjYzhlMDA0M2YzM2Y2MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1TrzlaEUQ2covJ8yCPPmk-xM0QgATcHu5UP5D6ymmHs';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print(tvResult);
    print(trendingResult);
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: modified_text(
          text: 'IMDB 🍿',
          color: Colors.white,
          size: 25,
        ),
      ),
      body: ListView(
        children: [
          TV(
            tv: tv,
          ),
          TrendingMovies(
            trending: trendingMovies,
          ),
          TopRatedMovies(
            topRated: topRatedMovies,
          ),
        ],
      ),
    );
  }
}
