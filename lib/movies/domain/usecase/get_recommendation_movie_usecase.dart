import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/base_usecase/base_usecase.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';

import '../repository/base_movies_repository.dart';

class GetMovieRecommendationUseCase extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<Recommendation>>> call(RecommendationParameters parameters) async {
    return await baseMovieRepository.getMovieRecommendation(parameters);
  }
}

class RecommendationParameters  extends Equatable {
  final int movieId;
  @override
  List<Object> get props => [movieId];

  const RecommendationParameters ({required this.movieId});
}