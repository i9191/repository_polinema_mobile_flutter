import 'dart:convert';
import 'dart:io';

import 'package:flutter_http_request/models/movie.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String apikey = 'b35105ce99929cbf2f11a3f29f8c5e11';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';
  
  Future<List?> getPopularMovies() async{
    final String uri = baseUrl + apikey;

    http.Response result = await http.get(Uri.parse(uri));
    if(result.statusCode == HttpStatus.ok){
      print('Sukses');
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    }else{
      print('Fail');
      return null;
    }
  }
}