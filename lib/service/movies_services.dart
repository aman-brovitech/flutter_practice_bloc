import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/model.dart';

Future<List<Movie>> fetchMovies() async {
  final response =
      await http.get(Uri.parse('https://reactnative.dev/movies.json'));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final movieData = jsonData['mobies'];
    return movieData.map<Movie>((json) => Movie.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch movies');
  }
}
