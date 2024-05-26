import 'dart:convert';
import 'dart:developer';
import 'package:netflix/Common/utils.dart';
import 'package:netflix/data/model/MovieModel.dart';
import 'package:http/http.dart' as http;

var key = '?api_key=$apiKey';
late String endpoint;

class ApiServiceNowPlayingMovie {
  Future<MovieModel> getNowPlayingMovie() async {
    endpoint = 'movie/now_playing';
    final url = '$baseUrl$endpoint$key';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("NowPlaying:${response.body}");
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to loading now playing movies");
  }
}
class ApiServicePopularMovies{
  Future<MovieModel>getPopularMovies()async{
    endpoint = 'movie/popular';
    final url = '$baseUrl$endpoint$key';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      log('Popural:${response.body}');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load popular movies'); 
    
  }
}
class ApiServicesUpcomingMovie {
  Future<MovieModel> getUpcomingMovies() async {
    endpoint = "movie/upcoming";
    final url = "$baseUrl$endpoint$key";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Upcoming:${response.body}');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load upcoming movies");
  }
}
class ApiServiceTopRatedMovie{
  Future<MovieModel> getTopRatedMovie()async{
    endpoint = "movie/top_rated";
    final url = "$baseUrl$endpoint$key";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      log('Trending:${response.body}');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load trending movies");
  }
}
