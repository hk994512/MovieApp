import 'package:flutter/material.dart';
import 'package:movie_app/models/pages/movie_details.dart';

class FilteredMovies extends StatelessWidget {
  const FilteredMovies({super.key, required this.movies});
  final List<dynamic> movies;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MovieDetail(movie: movie)));
            },
            leading: Image.network(
              'https://image.tmdb.org/t/p/w200${movie['poster_path']}',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(movie['title']),
            subtitle: Text(movie['overview']),
          );
        });
  }
}
