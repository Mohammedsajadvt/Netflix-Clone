import 'dart:convert';


import 'package:netflix/Common/utils.dart';
import 'package:netflix/data/model/nowplaying_model.dart';
import 'package:http/http.dart' as http;
var key = '?api_key=$apiKey';
late String endpoint;

class ApiServiceNowPlayingMovie{
  Future<NowPlayingMovieModel> getNowPlayingMovie()async{
    endpoint='movie/now_playing';
    final url = '$baseUrl$endpoint$key';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
    print("Success:${response.body}");
    return NowPlayingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to loading now playing movies");
  }
}