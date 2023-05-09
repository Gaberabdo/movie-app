import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/movies/data/models/movie_detail_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_movie_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovieRemoteDataSource();

  Future<List<MovieModel>> getPopularMovieRemoteDataSource();

  Future<List<MovieModel>> getTopRatedMovieRemoteDataSource();

  Future<MovieDetailModel> getMovieDetailRemoteDataSource(
      MovieDetailParameters parameters);
  Future<List<RecommendationModel>>getRecommendationMovieRemoteDataSource(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovieRemoteDataSource() async {
    final response = await Dio().get(AppConstance.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovieRemoteDataSource() async {
    final response = await Dio().get(AppConstance.popularMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovieRemoteDataSource() async {
    final response = await Dio().get(AppConstance.topRatedMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetailRemoteDataSource(MovieDetailParameters parameters) async {
    final response = await Dio().get(AppConstance.movieDetailPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovieRemoteDataSource(RecommendationParameters parameters) async{
    final response = await Dio().get(AppConstance.recommendationPath(parameters.movieId));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
