import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_test/data/repositories/character_repository.dart';
import 'package:rickandmorty_test/data/services/models/character_model/character_model.dart';
import 'package:rickandmorty_test/ui/bloc/character/character_event.dart';
import 'package:rickandmorty_test/ui/bloc/character/state/character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc(this._repository) : super(CharacterState()) {
    on<CharactersRequested>(_onCharacterRequested);
    on<CharacterNextPageRequested>(_onCharacterNextPageRequested);
  }
  int _currentPage = 1;
  final CharacterRepository _repository;

  Future<void> _onCharacterRequested(
    CharactersRequested event,
    Emitter<CharacterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final characters = await _repository.getCharacters(page: _currentPage);
      emit(state.copyWith(isLoading: false, characters: characters));
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Не удалось загрузить персонажей',
        ),
      );
    }
  }

  Future<void> _onCharacterNextPageRequested(
    CharacterNextPageRequested event,
    Emitter<CharacterState> emit,
  ) async {
    if (state.isLoading && state.characters.info.next != null) return;
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final nextPage = _currentPage + 1;
      final newCharacters = await _repository.getCharacters(page: nextPage);
      _currentPage = nextPage;
      emit(
        state.copyWith(
          characters: CharacterModel(
            info: newCharacters.info,
            results: [...state.characters.results, ...newCharacters.results],
          ),
          isLoading: false,
          error: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(error: 'Не удалось загрузить данные', isLoading: false),
      );
    }
  }
}
