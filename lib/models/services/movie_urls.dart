class MovieStrings {
  static String popularMovies() {
    return 'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';
  }

  static String upComingMovies() {
    return 'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1';
  }

  static String topRatedMovies() {
    return 'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1';
  }

  static String movieSimilar(int movieId) {
    return 'https://api.themoviedb.org/3/movie/$movieId/similar?language=en-US&page=1';
  }

  static String similarMovies(int movieId) {
    return MovieStrings.movieSimilar(movieId);
  }

  final popularMovie = MovieStrings.popularMovies();
  final upComingMovie = MovieStrings.upComingMovies();
  final topRatedMovie = MovieStrings.topRatedMovies();
  final headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MTFjYWE2NDdiYzFkOTYzY2U0ODdlYmNjMDE3YmZmOCIsIm5iZiI6MTczMTEyNDc1Ny4xMTA5MTk1LCJzdWIiOiI2NzJkOWEzZjRiMzBlOTI5Y2Q2ZjIwN2YiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.ijY02_YNM557qKTheRuyEwOKzdol0sxCdTNQjGd5EnE',
    'Accept': 'application/json', // Corrected the formatting of 'Accept' header
  };
}
