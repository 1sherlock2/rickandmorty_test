import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_test/data/repositories/character_repository.dart';
import 'package:rickandmorty_test/ui/bloc/character_by_id/character_by_id_event.dart';
import 'package:rickandmorty_test/ui/bloc/character_by_id/state/character_by_id_state.dart';

class CharacterByIdBloc extends Bloc<CharacterByIdEvent, CharacterByIdState> {
  CharacterByIdBloc(this._repository) : super(CharacterByIdState()) {
    on<CharacterByIdRequested>(_onCharacterByIdRequested);
  }

  final CharacterRepository _repository;

  Future<void> _onCharacterByIdRequested(
    CharacterByIdRequested event,
    Emitter<CharacterByIdState> emit,
  ) async {
    try {
      emit(state.copyWith(loading: true));
      final character = await _repository.getCharacter(event.characterId);
      emit(state.copyWith(character: character, error: null, loading: false));
    } catch (_) {
      emit(
        state.copyWith(error: 'Не удалось прогрузить страницу', loading: false),
      );
    }
  }
}
