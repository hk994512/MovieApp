import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'cached_image.dart';


class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key, required this.topRatedMovies});
  final List<dynamic> topRatedMovies;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: topRatedMovies.length,
        itemBuilder: (context, index, realIndex) {
          final movieImage = topRatedMovies[index];
          final movies =
              'https://image.tmdb.org/t/p/w300${movieImage['backdrop_path']}';
          return GestureDetector(
            onTap: () {},
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: loadImage(movies , false)),
          );
        },
        options: CarouselOptions(
            height: 200,
            enableInfiniteScroll: true,
            pageSnapping: true,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
            autoPlayAnimationDuration: const Duration(seconds: 1)));
  }
}
