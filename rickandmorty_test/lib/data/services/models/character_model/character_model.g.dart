// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterInfo _$CharacterInfoFromJson(Map<String, dynamic> json) =>
    _CharacterInfo(
      count: (json['count'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$CharacterInfoToJson(_CharacterInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };

_CharacterOrigin _$CharacterOriginFromJson(Map<String, dynamic> json) =>
    _CharacterOrigin(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$CharacterOriginToJson(_CharacterOrigin instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_CharacterLocation _$CharacterLocationFromJson(Map<String, dynamic> json) =>
    _CharacterLocation(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CharacterLocationToJson(_CharacterLocation instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_CharacterResult _$CharacterResultFromJson(Map<String, dynamic> json) =>
    _CharacterResult(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: CharacterOrigin.fromJson(json['origin'] as Map<String, dynamic>),
      location: CharacterLocation.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      image: json['image'] as String,
      episode: (json['episode'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      url: json['url'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$CharacterResultToJson(_CharacterResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };

_CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    _CharacterModel(
      info: CharacterInfo.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterModelToJson(_CharacterModel instance) =>
    <String, dynamic>{'info': instance.info, 'results': instance.results};
