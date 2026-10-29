// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterState _$CharacterStateFromJson(Map<String, dynamic> json) =>
    _CharacterState(
      characters: json['characters'] == null
          ? const []
          : CharacterModel.fromJson(json['characters'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String? ?? null,
    );

Map<String, dynamic> _$CharacterStateToJson(_CharacterState instance) =>
    <String, dynamic>{
      'characters': instance.characters,
      'isLoading': instance.isLoading,
      'error': instance.error,
    };
