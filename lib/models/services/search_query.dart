List<dynamic> searchMovieQuery(
  String query,
  bool isSearchEmpty,
  List<dynamic> popularMovies,
  List<dynamic> topRatedMovies,
  List<dynamic> upComingMovies,
) {
  List<dynamic> filteredMovies = [];

  if (query.isEmpty) {
    isSearchEmpty = true;
  } else {
    isSearchEmpty = false;
    filteredMovies = [
      ...popularMovies.where((mov) =>
          mov['title'].toString().toLowerCase().contains(query.toLowerCase())),
      ...topRatedMovies.where((mov) =>
          mov['title'].toString().toLowerCase().contains(query.toLowerCase())),
      ...upComingMovies.where((mov) =>
          mov['title'].toString().toLowerCase().contains(query.toLowerCase())),
    ];
  }

  return filteredMovies;
}
