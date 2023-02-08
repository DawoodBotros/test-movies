import 'dart:convert';

import 'package:http/http.dart';

import '../../../model/SourcesLatest.dart';
import '../../../model/SourcesTopRated.dart';
import '../../../model/popular_response.dart';
import 'package:http/http.dart' as http;

import '../../../model/searchResponse.dart';
import '../../../model/similarResponse.dart';
import '../../constants/constants.dart';

class ApiManager {
  static Future<TopPopular> getMovieDataPopular() async {
    var response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=7aa670a039049fe47b8c7fc56d2bf588&language=en-US&page=1'),
    );
    try {
      print(response.statusCode);
      var json = jsonDecode(response.body);
      print(json.hashCode);
      TopPopular popular = TopPopular.fromJson(json);
      print(popular.results);
      return popular;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  static Future<SourcesLatest> getMovieDataLatest() async {
    Uri URL = Uri.https(BASE, '/3/movie/latest', {
      "api_key": APIKEY,
    });
    try {
      Response response = await http.get(URL);
      print(response);
      var json = jsonDecode(response.body);
      print(json);
      SourcesLatest sourcesLatest = SourcesLatest.fromJson(json);
      print(sourcesLatest);
      return sourcesLatest;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  static Future<SourcesTopRated> getMovieDataTopRated() async {
    Uri URL = Uri.https(BASE, '/3/movie/top_rated', {
      "api_key": APIKEY,
    });
    try {
      Response response = await http.get(URL);
      print(response);
      var json = jsonDecode(response.body);
      print(json);
      SourcesTopRated sourcesTopRated = SourcesTopRated.fromJson(json);
      print(sourcesTopRated);
      return sourcesTopRated;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  static Future<SimilarResponse> getSimilar({required String? movieID}) async {
    try {
      //https://api.themoviedb.org/3/movie/{movie_id}/similar?api_key=6e47b8fd3d3192ba9120b08bd814b75d
      Uri url = Uri.https(BASE, '/3/movie/$movieID/similar', {
        "api_key": APIKEY,
        "movie_id": "movieID",
      });

      Response similarMovie = await http.get(url);

      var json = jsonDecode(similarMovie.body);
      print(json);
      SimilarResponse similarResponse = SimilarResponse.fromJson(json);

      return similarResponse;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<SearchResponse> getMovie({required String movieName}) async {
    try {
      Uri url = Uri.https(BASE, '/3/search/movie', {
        "api_key": APIKEY,
        "query": movieName,
      });
      Response movieSearch = await http.get(url);
      var json = jsonDecode(movieSearch.body);
      SearchResponse searchResponse = SearchResponse.fromJson(json);
      return searchResponse;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
