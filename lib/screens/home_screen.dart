import 'package:flutter/material.dart';
import 'package:movie/widgets/top_rated.dart';
import 'package:movie/widgets/trending.dart';
import 'package:movie/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMoviesList = [];
List topRatedMoviesList = [];
List tvList = [];
  final String apikey = 'a9634113b19cd1ca8f2f8333e73338cb';
  final String accesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOTYzNDExM2IxOWNkMWNhOGYyZjgzMzNlNzMzMzhjYiIsInN1YiI6IjY0NThmN2M4NmM4NDkyMDE4MTg3ZTkyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IOpRe4k_BtJTx6nkdyib8lhKR00bFvJ5IDx5QkSVnd0';

@override
void initState() { 
  loadMovies();
  super.initState();
  
}
  loadMovies()async{
    TMDB tmdpCustomLog = TMDB(ApiKeys(apikey, accesstoken),logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ) );
    Map trendingResults = await tmdpCustomLog.v3.trending.getTrending();
    Map topRatedMovies = await tmdpCustomLog.v3.movies.getTopRated();
    Map tV = await tmdpCustomLog.v3.tv.getPopular();
    
    setState(() {
      trendingMoviesList = trendingResults['results'];
      topRatedMoviesList = topRatedMovies['results'];
      tvList = tV['results'];
    });
    print(tvList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text('Movawy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
      ),
      body: ListView(
        children: [
          TopRated(topRated: topRatedMoviesList),
          TrendingMovies(trending: trendingMoviesList),
          TvWidget(tv: tvList)
        ],
      ),
    );
  }
}