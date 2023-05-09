import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_movie_usecase.dart';

import '../../../core/utils/enums.dart';
import '../../data/models/movie_detail_model.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/usecase/get_movie_detail_usecase.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationUseCase;
  MovieDetailBloc(this.getMovieDetailUseCase,this.getMovieRecommendationUseCase)
      : super(const MovieDetailState()) {
    on<GetMovieDetailEvent>(_getMovieDetail);
    on<GetMovieRecommendationEvent>(_getRecommendationMovie);
  }

  FutureOr<void> _getMovieDetail(event, emit) async {
    final result =
        await getMovieDetailUseCase(MovieDetailParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailState: RequestState.error,
              movieDetailMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetailState: RequestState.success,
              movieDetail: r,
            )));
  }
  FutureOr<void> _getRecommendationMovie(event, emit) async {
    final result =
    await getMovieRecommendationUseCase(RecommendationParameters(movieId: event.id));
    result.fold(
            (l) => emit(state.copyWith(
          recommendationState:  RequestState.error,
          recommendationMessage:  l.message,
        )),
            (r) => emit(state.copyWith(
          recommendationState:  RequestState.success,
          recommendation:  r,
        )));
  }
}
