import 'package:flutter/material.dart';
import '/models/pages/movie_details.dart';

import '../services/movie_services.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  bool isLoading = true;
  List<dynamic> upcomingMovies = [];
  void moviesServiceStates() async {
    MovieServices movieServices = MovieServices();

    upcomingMovies = await movieServices.upComingMovies();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    moviesServiceStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UpComing Movies"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2, // No of columns
              mainAxisSpacing: 10, // Spacing b/w rows
              crossAxisSpacing: 10, // Spacing b/w columns
              children: List.generate(upcomingMovies.length, (index) {
                final movie = upcomingMovies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieDetail(movie: movie)));
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.network(
                              fit: BoxFit.cover,
                              height: 150,
                              width: double.infinity,
                              'https://image.tmdb.org/t/p/w300${movie['backdrop_path']}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            movie['title'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
