import 'package:json_annotation/json_annotation.dart';
part 'move_model.g.dart';

@JsonSerializable()
class MoveModel {
  final bool? adult;
  final bool? video;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  final String overview;
  final String title;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final int id;
  final int popularity;
  @JsonKey(name: 'vote_average')
  final int voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;

  MoveModel({
    this.adult = true,
    this.video = true,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.id,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
  });
  factory MoveModel.fromJson(Map<String, dynamic> json) =>
      _$MoveModelFromJson(json);
  Map<String, dynamic> toJson() => _$MoveModelToJson(this);
}
