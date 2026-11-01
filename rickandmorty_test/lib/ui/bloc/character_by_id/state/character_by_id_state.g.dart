// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_by_id_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterByIdState _$CharacterByIdStateFromJson(Map<String, dynamic> json) =>
    _CharacterByIdState(
      character: json['character'] == null
          ? null
          : CharacterResult.fromJson(json['character'] as Map<String, dynamic>),
      error: json['error'] as String? ?? null,
      loading: json['loading'] as bool? ?? false,
    );

Map<String, dynamic> _$CharacterByIdStateToJson(_CharacterByIdState instance) =>
    <String, dynamic>{
      'character': instance.character,
      'error': instance.error,
      'loading': instance.loading,
    };
