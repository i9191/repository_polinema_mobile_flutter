import 'package:flutter/material.dart';
import 'package:flutter_http_request/pages/movie_detail.dart';
import 'package:flutter_http_request/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount = null;
  late List movies;
  late HttpService service;

  Future initialize() async{
    movies = [];
    movies = (await service.getPopularMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState(){
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              // 7.4 challenge tambah gambar di listview
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://image.tmdb.org/t/p/w500${movies[position].posterPath}"),
              ),
              title: Text(movies[position].title),
              subtitle: Text(
                'Rating = ' + movies[position].voteAverage.toString(),
              ),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => MovieDetail(movies[position]));
                Navigator.push(context, route);
              }
            ),
          );
        },
      )
    );
  }
}