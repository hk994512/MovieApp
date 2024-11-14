import 'package:flutter/material.dart';
import '/models/pages/movie_details.dart';

import 'cached_image.dart';


class HorizontalView extends StatelessWidget {
  const HorizontalView({super.key, required this.movies});
  final List<dynamic> movies;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(movies.length, (index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MovieDetail(movie: movie)));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  loadImage(
                      'https://image.tmdb.org/t/p/w300${movie['poster_path']}',
                      true),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(movie['title'])
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
