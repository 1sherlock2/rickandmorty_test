import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickandmorty_test/data/services/models/character_model/character_model.dart';

part 'character_by_id_state.freezed.dart';
part 'character_by_id_state.g.dart';

@freezed
abstract class CharacterByIdState with _$CharacterByIdState {
  factory CharacterByIdState({
    CharacterResult? character,
    @Default(null) String? error,
    @Default(false) bool loading,
  }) = _CharacterByIdState;

  factory CharacterByIdState.fromJson(Map<String, dynamic> json) =>
      _$CharacterByIdStateFromJson(json);
}
