import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/toast_message.dart';
import './movie_urls.dart';

class MovieServices {
  Future<List<dynamic>> popularMovies() async {
    try {
      final res = await http.get(
        Uri.parse(MovieStrings().popularMovie),
        headers: MovieStrings().headers,
      );

      if (res.statusCode == 200) {
        debugPrint(res.body);
        return json.decode(res.body)['results'];
      } else {
        throw Exception("Failed to load popular movies.");
      }
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception("Could not load popular movies.");
    }
  }

  // Fetch upcoming movies
  Future<List<dynamic>> upComingMovies() async {
    try {
      final res = await http.get(
        Uri.parse(MovieStrings().upComingMovie),
        headers: MovieStrings().headers,
      );

      if (res.statusCode == 200) {
        return json.decode(res.body)['results'];
      } else {
        throw Exception("Failed to load upcoming movies.");
      }
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception("Could not load upcoming movies.");
    }
  }

  // Fetch top-rated movies
  Future<List<dynamic>> topRatedMovies() async {
    try {
      final res = await http.get(
        Uri.parse(MovieStrings().topRatedMovie),
        headers: MovieStrings().headers,
      );

      if (res.statusCode == 200) {
        debugPrint(res.body);
        return json.decode(res.body)['results'];
      } else {
        throw Exception("Failed to load top-rated movies.");
      }
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception("Could not load top-rated movies.");
    }
  }

  Future<List<dynamic>> similarMovies(int movieId) async {
    try {
      final res = await http.get(
        Uri.parse(MovieStrings.similarMovies(movieId)),
        headers: MovieStrings().headers,
      );

      if (res.statusCode == 200) {
        debugPrint(res.body);
        return json.decode(res.body)['results'];
      } else {
        throw Exception("Failed to load similar movies.");
      }
    } catch (e) {
      debugPrint('Error: $e');
      toastMessage("Failed to load similar movies. Please try again later.");
      throw Exception("Could not load similar movies.");
    }
  }
}
