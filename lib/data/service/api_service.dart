import 'dart:convert';
import 'dart:developer';
import 'package:netflix/Common/utils.dart';
import 'package:netflix/data/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/data/model/search_model.dart';

var key = '?api_key=$apiKey';
late String endpoint;

class ApiServices {
  Future<MovieModel> getNowPlayingMovie() async {
    endpoint = 'movie/now_playing';
    final url = '$baseUrl$endpoint$key';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("NowPlaying:${url}");
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to loading now playing movies");
  }
  Future<MovieModel>getPopularMovies()async{
    endpoint = 'movie/popular';
    final url = '$baseUrl$endpoint$key';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      log('Popural:${url}');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load popular movies'); 
    
  }
  Future<MovieModel> getUpcomingMovies() async {
    endpoint = "movie/upcoming";
    final url = "$baseUrl$endpoint$key";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Upcoming:${url}');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load upcoming movies");
  }
  Future<MovieModel> getTopRatedMovie()async{
    endpoint = "movie/top_rated";
    final url = "$baseUrl$endpoint$key";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      log('TopRated:${url}');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load trending movies");
  }
   Future<SearchModel> getSearchMovie(String searchText)async{
    endpoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endpoint";
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NDM0ZmQ4Nzk0MjM0NDUwYmY3MDhlZGYxMTc0ZjVmYiIsInN1YiI6IjY2MzUyMzczOTU5MGUzMDEyOWJiOWY5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.A9NZA5HOYY0qvAAFgttWWquo8fBxBXwn3oomoJ80KXE"
    });
    if(response.statusCode==200){
      log('TopRated:${url}');
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load search movies");
  }
}


