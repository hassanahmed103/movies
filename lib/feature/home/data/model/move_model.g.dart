// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveModel _$MoveModelFromJson(Map<String, dynamic> json) => MoveModel(
      adult: json['adult'] as bool? ?? true,
      video: json['video'] as bool? ?? true,
      backdropPath: json['backdrop_path'] as String?,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String,
      id: (json['id'] as num).toInt(),
      popularity: (json['popularity'] as num).toInt(),
      voteAverage: (json['vote_average'] as num).toInt(),
      voteCount: (json['vote_count'] as num).toInt(),
      genreIds: (json['genre_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$MoveModelToJson(MoveModel instance) => <String, dynamic>{
      'adult': instance.adult,
      'video': instance.video,
      'backdrop_path': instance.backdropPath,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'id': instance.id,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'genre_ids': instance.genreIds,
    };
