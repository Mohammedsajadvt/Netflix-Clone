import 'dart:convert';
import 'dart:developer';
import 'package:netflix/Common/utils.dart';
import 'package:netflix/data/model/upcoming_model.dart';
import 'package:http/http.dart' as http;

var key = "?api_key=$apiKey";
late String endpoint;

class ApiServicesUpcomingMovie {
  Future<UpcomingMovieModel> getUpcomingMovies()async{
    endpoint="movie/upcoming";
    final url = "$baseUrl$endpoint$key";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
     log('Upcoming:${response.body}');
     return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load upcoming movies");
  }
}
