import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movie/screens/tabs/details/similarResponse.dart';

import 'search/constant.dart';
import 'search/searchResponse.dart';




class ApiManger {
  static Future<SimilarResponse> getSimilar({required String? movieID}) async {
    try{

      //https://api.themoviedb.org/3/movie/{movie_id}/similar?api_key=6e47b8fd3d3192ba9120b08bd814b75d
      Uri url = Uri.https(baseUrl, '/3/movie/$movieID/similar', {
        "api_key": apiKey,
        "movie_id": "movieID",
      });

      Response similarMovie = await http.get(url);

      var json = jsonDecode(similarMovie.body);
      print(json);
      SimilarResponse similarResponse = SimilarResponse.fromJson(json);


      return similarResponse;

    }

    catch(e){
      print(e);
      throw e ;
    }
  }
  static Future<SearchResponse> getMovie({String? movieName}) async {
    try{
      Uri url = Uri.https(baseUrl, '/3/search/movie', {
        "api_key": apiKey,
        "query": movieName,
      });

      Response movieSearch = await http.get(url);

      var json = jsonDecode(movieSearch.body);
      SearchResponse searchResponse = SearchResponse.fromJson(json);
      return searchResponse;
    }

    catch(e){
      print(e);
      throw e ;
    }
  }
}
