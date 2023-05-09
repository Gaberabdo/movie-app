import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final num voteAverage;
  final dynamic releaseData;

  const Movie({
    required this.releaseData,
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        genreIds,
        overview,
        voteAverage,
        releaseData,
      ];
}
