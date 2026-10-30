// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterState _$CharacterStateFromJson(Map<String, dynamic> json) =>
    _CharacterState(
      characters: json['characters'] == null
          ? null
          : CharacterModel.fromJson(json['characters'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String? ?? null,
      pages:
          (json['pages'] as List<dynamic>?)
              ?.map(
                (e) => (e as List<dynamic>)
                    .map(
                      (e) =>
                          CharacterResult.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
              )
              .toList() ??
          const [],
      pageKeys:
          (json['pageKeys'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      retryAfterSeconds: (json['retryAfterSeconds'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CharacterStateToJson(_CharacterState instance) =>
    <String, dynamic>{
      'characters': instance.characters,
      'isLoading': instance.isLoading,
      'error': instance.error,
      'pages': instance.pages,
      'pageKeys': instance.pageKeys,
      'retryAfterSeconds': instance.retryAfterSeconds,
    };
