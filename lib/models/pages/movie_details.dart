import 'package:flutter/material.dart';

import '../services/movie_services.dart';
import '../widgets/horizontal_view.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key, required this.movie});
  final dynamic movie;
  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  List<dynamic> similarMovies = [];
  var fetchedMovies = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    movieProvider();
  }

  Future<void> movieProvider() async {
    MovieServices movieServices = MovieServices();
    fetchedMovies = await movieServices.similarMovies(widget.movie['id']);
    setState(() {
      similarMovies = fetchedMovies;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie['title'])),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w300${widget.movie['backdrop_path']}',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Title: ${widget.movie['title']}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "OverView: ${widget.movie['overview']}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Release: ${widget.movie['release_date']}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Rating: ${widget.movie['vote_average']}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Vote: ${widget.movie['vote_count']}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Popularity: ${widget.movie['popularity']}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Similar Movies",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.pink,
                    ),
                  )
                : HorizontalView(movies: similarMovies)
          ],
        ),
      ),
    );
  }
}
