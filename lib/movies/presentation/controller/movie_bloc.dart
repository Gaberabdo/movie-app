import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/base_usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_state.dart';

import 'movie_event.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MovieBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MovieState()) {
    on<GetNowPlayingMovieEvent>(_getNowPlaying);
    on<GetTopRatedMovieEvent>(_getTopRated);
    on<GetMostPopularMovieEvent>(_getMostPopular);
  }

  FutureOr<void> _getMostPopular(event, emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              popularState: RequestState.success,
              popularMovies: r,
            )));
  }

  FutureOr<void> _getTopRated(event, emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              topRatedState: RequestState.success,
              topRatedMovie: r,
            )));
  }

  FutureOr<void> _getNowPlaying(event, emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              nowPlayingState: RequestState.success,
              nowPlayingMovie: r,
            )));
  }
}
