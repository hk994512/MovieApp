import 'package:flutter/material.dart';

import 'horizontal_view.dart';
import 'movie_slider.dart';

class MoviesProvider extends StatelessWidget {
  const MoviesProvider({
    super.key,
    required this.topRatedMovies,
    required this.upComingMovies,
    required this.popularMovies,
  });

  final List topRatedMovies;
  final List upComingMovies;
  final List popularMovies;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Top Rated Movies",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        MovieSlider(topRatedMovies: topRatedMovies),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Upcoming Movies",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        HorizontalView(movies: upComingMovies),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Popular Movies",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        HorizontalView(movies: popularMovies)
      ],
    );
  }
}
