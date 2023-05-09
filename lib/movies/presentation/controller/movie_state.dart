import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/data/models/movie_detail_model.dart';

import '../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovie;
  final RequestState topRatedState;
  final String topRatedMessage;



  MovieState copyWith({
    List<Movie>? nowPlayingMovie,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovie,
    RequestState? topRatedState,
    String? topRatedMessage,
    List<MovieDetailModel>? movieDetail,
    RequestState? movieDetailState,
    String? movieDetailMessage,
  }) {
    return MovieState(
        nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMovie: topRatedMovie ?? this.topRatedMovie,
        topRatedState: topRatedState ?? this.topRatedState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,

    );
  }

  const MovieState({
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.topRatedMovie = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',

  });

  @override
  List<Object> get props =>
      [
        nowPlayingMovie,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovie,
        topRatedState,
        topRatedMessage,
      ];
}
