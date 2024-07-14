class ApiConst {
  static const String apiKey = 'e201c75f46edb6a85375f87b6f6fb478';
  static const String baseUlr = 'https://api.themoviedb.org/3';
  static const String popular='$baseUlr/movie/popular';
  static const String favorite='$baseUlr/account/{account_id}/favorite/movies';
  static const String nowPlaying='$baseUlr/movie/now_playing';
  static const String topRated='$baseUlr/movie/top_rated';
  static const String upcoming='$baseUlr/movie/upcoming';
  static const String search='$baseUlr/search/movie';
  static const String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMjAxYzc1ZjQ2ZWRiNmE4NTM3NWY4N2I2ZjZmYjQ3OCIsIm5iZiI6MTcyMDg0NDI2Ny44NjY4MjQsInN1YiI6IjY2ODU5NzQyOWY1OGYwYzhlNGIwNjY3YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XmeoPd89Ng60ee4fPBAMu0SFuutxqcqmD6cgWZjY0gA';
static const String urlImagePoster='https://image.tmdb.org/t/p/w92//';
static const String urlImageBackdrop='https://image.tmdb.org/t/p/w780//';
}