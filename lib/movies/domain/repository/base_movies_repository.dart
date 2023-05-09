import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_detail_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_detail.dart';
import '../usecase/get_recommendation_movie_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetail>> getMovieDetail(MovieDetailParameters parameters);
  Future<Either<Failure,List<Recommendation>>> getMovieRecommendation(RecommendationParameters parameters);
}
