import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final String title;
  final String overview;
  final dynamic releaseData;
  final num voteAverage;
  final List<Genres> genres;
  final int id;
  final int runtime;

  const MovieDetail({
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.releaseData,
    required this.voteAverage,
    required this.genres,
    required this.id,
    required this.runtime,
  });

  @override
  List<Object> get props => [
        backdropPath,
        title,
        overview,
        releaseData,
        voteAverage,
        genres,
        id,
        runtime,
      ];
}

class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}
