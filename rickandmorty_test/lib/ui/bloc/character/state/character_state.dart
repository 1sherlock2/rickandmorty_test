import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickandmorty_test/data/services/models/character_model/character_model.dart';

part 'character_state.freezed.dart';
part 'character_state.g.dart';

@freezed
abstract class CharacterState with _$CharacterState {
  factory CharacterState({
    @Default([]) CharacterModel characters,
    @Default(false) bool isLoading,
    @Default(null) String? error,
  }) = _CharacterState;

  factory CharacterState.fromJson(Map<String, dynamic> json) =>
      _$CharacterStateFromJson(json);
}
