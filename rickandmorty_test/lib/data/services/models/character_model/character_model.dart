import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
abstract class CharacterInfo with _$CharacterInfo {
  factory CharacterInfo({
    required int count,
    required int pages,
    required String? next,
    required String? prev,
  }) = _CharacterInfo;

  factory CharacterInfo.fromJson(Map<String, dynamic> json) =>
      _$CharacterInfoFromJson(json);
}

@freezed
abstract class CharacterOrigin with _$CharacterOrigin {
  factory CharacterOrigin({required String name, required String url}) =
      _CharacterOrigin;

  factory CharacterOrigin.fromJson(Map<String, dynamic> json) =>
      _$CharacterOriginFromJson(json);
}

@freezed
abstract class CharacterLocation with _$CharacterLocation {
  factory CharacterLocation({required String name, required String url}) =
      _CharacterLocation;

  factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationFromJson(json);
}

@freezed
abstract class CharacterResult with _$CharacterResult {
  factory CharacterResult({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required CharacterOrigin origin,
    required CharacterLocation location,
    required String image,
    required List<String> episode,
    required String url,
    required String created,
  }) = _CharacterResult;

  factory CharacterResult.fromJson(Map<String, dynamic> json) =>
      _$CharacterResultFromJson(json);
}

@freezed
abstract class CharacterModel with _$CharacterModel {
  factory CharacterModel({
    required CharacterInfo info,
    required List<CharacterResult> results,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}
