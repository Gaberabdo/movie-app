import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/base_usecase/base_usecase.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

import '../repository/base_movies_repository.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail, MovieDetailParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,MovieDetail>> call(MovieDetailParameters parameters) async {
    return await baseMovieRepository.getMovieDetail(parameters);
  }
}

class MovieDetailParameters extends Equatable {
  final int movieId;
  @override
  List<Object> get props => [movieId];

 const MovieDetailParameters({required this.movieId});
}