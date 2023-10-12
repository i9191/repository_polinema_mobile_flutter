import 'package:flutter/material.dart';
import 'package:flutter_http_request/models/movie.dart';

class MovieDetail extends StatelessWidget{
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if(movie.posterPath != null){
      path = imgPath + movie.posterPath;
    }else{
      path = 'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.black, 
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [ 
              Stack( 
                children: [ 
                  Container( 
                    padding: EdgeInsets.all(16), 
                    height: height / 1.5, 
                    child: ClipRRect( 
                      borderRadius: BorderRadius.circular(16), 
                      child: Image.network(path, fit: BoxFit.cover), 
                    ), 
                    decoration: BoxDecoration( 
                      boxShadow: [ 
                        BoxShadow( 
                          color: Colors.grey.withOpacity(0.4), 
                          spreadRadius: 5, 
                          blurRadius: 7, 
                          offset: Offset(0, 3), 
                        ), 
                      ],
                    ), 
                  ), 
                  Positioned(
                    top: 16, 
                    right: 16, 
                    child: IconButton( 
                      icon: Icon(Icons.favorite, color: Colors.red, size: 32), 
                      onPressed: () { // belum kepikiran 
                      }, 
                    ), 
                  ), 
                ], 
              ), 
              Container( 
                padding: EdgeInsets.symmetric(horizontal: 16), 
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [ 
                    Flexible( 
                      child: Text(movie.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), overflow: TextOverflow.fade), 
                    ), 
                    Row(
                      children: List.generate(5, (index) { // fungsi bintang penuh/kosong 
                        return Icon( 
                          index < movie.voteAverage ~/ 2 ? Icons.star : Icons.star_border,  
                          color: Colors.yellow, 
                        ); 
                      }), 
                    ), 
                  ], 
                ), 
              ), 
              SizedBox(height: 8), 
              Container( 
                padding: EdgeInsets.symmetric(horizontal: 16), 
                child: Text(movie.overview, style: TextStyle(fontSize: 16)), 
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  }
}