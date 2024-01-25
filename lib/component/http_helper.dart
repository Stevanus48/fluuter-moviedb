import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pertemuan11/model/movie.dart';

class HttpHelper {
  final String urlKey = 'api_key=b476bc9be9e167b08af27ebb7790dd24';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlTopRated = '/top_rated?';

  final String urlLanguage = '&language=en-US';

  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=b476bc9be9e167b08af27ebb7790dd24&query=';

  Future<String> getUpcoming() async {
    final Uri upcoming =
        Uri.parse(urlBase + urlUpcoming + urlKey + urlLanguage);
    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    } else {
      return '{}';
    }
  }

  Future<List> getUpcomingAsList() async {
    final Uri upcoming =
        Uri.parse(urlBase + urlUpcoming + urlKey + urlLanguage);

    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponseBody = json.decode(result.body);
      final movieObjects = jsonResponseBody['results'];
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();
      return movies;
    } else {
      return [];
    }
  }

  Future<List> getTopRatedMovieAsList() async {
    final Uri topRated = Uri.parse(
      urlBase + urlTopRated + urlKey + urlLanguage,
    );

    http.Response result = await http.get(topRated);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponseBody = json.decode(result.body);
      final movieObjects = jsonResponseBody['results'];
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();
      return movies;
    } else {
      return [];
    }
  }

  Future<List> findMovies(String title) async {
    final Uri query = Uri.parse(urlSearchBase + title);
    http.Response hasilCari = await http.get(query);

    if (hasilCari.statusCode == HttpStatus.ok) {
      final jsonResponseBody = json.decode(hasilCari.body);
      final movieObjects = jsonResponseBody['results'];
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();

      return movies;
    } else {
      return [];
    }
  }
}
