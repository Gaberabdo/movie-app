part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailState;
  final String movieDetailMessage;

  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailState,
    String? movieDetailMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  const MovieDetailState({
    this.movieDetail,
    this.movieDetailState = RequestState.loading,
    this.movieDetailMessage = '',
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailState,
        movieDetailMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
