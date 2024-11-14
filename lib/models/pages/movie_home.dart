import 'package:flutter/material.dart';

import '../services/movie_services.dart';
import '../services/search_query.dart';

import '../widgets/filtered_movies.dart';
import '../widgets/movie_search.dart';
import '../widgets/movies_provider.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  List<dynamic> popularMovies = [];
  List<dynamic> topRatedMovies = [];
  List<dynamic> upComingMovies = [];
  List<dynamic> filteredMovies = [];
  bool isSearchEmpty = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    moviesServiceStates();
  }

  // Fetch movie data
  void moviesServiceStates() async {
    MovieServices movieServices = MovieServices();
    popularMovies = await movieServices.popularMovies();
    topRatedMovies = await movieServices.topRatedMovies();
    upComingMovies = await movieServices.upComingMovies();
    setState(() {
      isLoading = false;
    });
  }

  void searchResults(String query) {
    setState(() {
      filteredMovies = searchMovieQuery(
          query, isSearchEmpty, popularMovies, topRatedMovies, upComingMovies);
      isSearchEmpty = query.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 5),
          MovieSearchBar(
            onChanged: (query) {
              searchResults(
                  query); // Update filteredMovies based on search query
            },
            isEmpty: isSearchEmpty, // Pass the search status to the search bar
          ),
          const SizedBox(height: 10),
          isLoading
              ? const CircularProgressIndicator(color: Colors.pink)
              : isSearchEmpty
                  // Show all movies if the search query is empty
                  ? Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Popular Movies",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MoviesProvider(
                          topRatedMovies: topRatedMovies,
                          upComingMovies: upComingMovies,
                          popularMovies: popularMovies,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Filtered Movies",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        filteredMovies.isNotEmpty
                            ? FilteredMovies(movies: filteredMovies)
                            : const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  'No movies found for your provided Search',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red),
                                ),
                              ),
                      ],
                    ),
        ],
      ),
    );
  }
}
