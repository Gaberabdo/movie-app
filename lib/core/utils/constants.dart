class AppConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String appKey = 'c74f9dc2d7252c7a5f22e90e150919bb';

  static const String nowPlayingMoviePath =
      '$baseUrl/movie/now_playing?api_key=$appKey';

  static const String popularMoviePath =
      '$baseUrl/movie/popular?api_key=$appKey';

  static const String topRatedMoviePath =
      '$baseUrl/movie/top_rated?api_key=$appKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';

  static String movieDetailPath(int movieId) => '$baseUrl/movie/$movieId?api_key=$appKey';
  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$appKey";

}
