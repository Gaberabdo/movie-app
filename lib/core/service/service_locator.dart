import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_movie_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc.dart';
import '../../movies/domain/usecase/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controller/movie_detail_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    ///Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    ///UseCase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieRecommendationUseCase(sl()));

    ///Bloc
    sl.registerFactory(() => MovieBloc(sl(),sl(),sl(),));

    ///Bloc
    sl.registerFactory(() => MovieDetailBloc(sl(),sl()));
  }
}
