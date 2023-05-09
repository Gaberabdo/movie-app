import '../../domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.backdropPath,
    required super.title,
    required super.overview,
    required super.releaseData,
    required super.voteAverage,
    required super.genres,
    required super.id,
    required super.runtime,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      backdropPath: json['backdrop_path'],
      title: json['title'],
      overview: json['overview'],
      releaseData: json['release_date'],
      voteAverage: json['vote_average'],
      genres: List<GenresModel>.from((json['genres']).map((e) => GenresModel.fromJson(e))),
      id: json['id'],
      runtime: json['runtime'],
    );
  }
}

class GenresModel extends Genres {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }
}