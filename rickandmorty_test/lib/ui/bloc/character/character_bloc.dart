import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_test/data/repositories/character_repository.dart';
import 'package:rickandmorty_test/data/services/models/character_model/character_model.dart';
import 'package:rickandmorty_test/ui/bloc/character/character_event.dart';
import 'package:rickandmorty_test/ui/bloc/character/state/character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc(this._repository) : super(CharacterState()) {
    on<CharactersRequested>(_onCharacterRequested);
    on<CharacterNextPageRequested>(_onCharacterNextPageRequested);
    on<CharacterRetryCountdownTick>(_onRetryCountdownTick);
  }

  int _currentPage = 1;
  int _rateLimitAttempts = 0;
  DateTime? _retryNotBefore;
  Timer? _retryTimer;
  final CharacterRepository _repository;

  Future<void> _onCharacterRequested(
    CharactersRequested event,
    Emitter<CharacterState> emit,
  ) async {
    _retryTimer?.cancel();
    _retryNotBefore = null;
    _rateLimitAttempts = 0;
    _currentPage = 1;
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
        retryAfterSeconds: 0,
        characters: null,
        pages: [],
        pageKeys: [],
      ),
    );
    try {
      final characters = await _repository.getCharacters(page: _currentPage);
      emit(
        state.copyWith(
          isLoading: false,
          characters: characters,
          pages: [characters.results],
          pageKeys: [_currentPage],
        ),
      );
    } catch (error, stackTrace) {
      debugPrint('Page 1 failed: $error\n$stackTrace');
      emit(state.copyWith(isLoading: false, error: error.toString()));
    }
  }

  Future<void> _onCharacterNextPageRequested(
    CharacterNextPageRequested event,
    Emitter<CharacterState> emit,
  ) async {
    if (state.isLoading || state.characters?.info.next == null) return;
    final retryNotBefore = _retryNotBefore;
    if (retryNotBefore != null && DateTime.now().isBefore(retryNotBefore)) {
      return;
    }
    final nextPage = _currentPage + 1;
    emit(state.copyWith(isLoading: true, error: null, retryAfterSeconds: 0));
    try {
      final newCharacters = await _repository.getCharacters(page: nextPage);
      _currentPage = nextPage;
      _retryNotBefore = null;
      _retryTimer?.cancel();
      _retryTimer = null;
      _rateLimitAttempts = 0;
      emit(
        state.copyWith(
          characters: CharacterModel(
            info: newCharacters.info,
            results: [...state.characters!.results, ...newCharacters.results],
          ),
          pages: [...state.pages, newCharacters.results],
          pageKeys: [...state.pageKeys, nextPage],
          isLoading: false,
          error: null,
        ),
      );
    } catch (error, stackTrace) {
      debugPrint('Page $nextPage failed: $error\n$stackTrace');
      final retryDelay =
          error is DioException && error.response?.statusCode == 429
          ? _retryDelayFor(error)
          : Duration.zero;
      _retryNotBefore = retryDelay > Duration.zero
          ? DateTime.now().add(retryDelay)
          : null;
      emit(
        state.copyWith(
          error: error.toString(),
          isLoading: false,
          retryAfterSeconds: _secondsRemaining(retryDelay),
        ),
      );
      if (retryDelay > Duration.zero) {
        _retryTimer?.cancel();
        _retryTimer = Timer.periodic(
          const Duration(seconds: 1),
          (_) => add(const CharacterRetryCountdownTick()),
        );
      }
    }
  }

  void _onRetryCountdownTick(
    CharacterRetryCountdownTick event,
    Emitter<CharacterState> emit,
  ) {
    final retryNotBefore = _retryNotBefore;
    if (retryNotBefore == null) {
      _retryTimer?.cancel();
      _retryTimer = null;
      return;
    }

    final remaining = retryNotBefore.difference(DateTime.now());
    if (remaining <= Duration.zero) {
      _retryTimer?.cancel();
      _retryTimer = null;
      _retryNotBefore = null;
      add(const CharacterNextPageRequested());
      return;
    }

    emit(state.copyWith(retryAfterSeconds: _secondsRemaining(remaining)));
  }

  Duration _retryDelayFor(DioException error) {
    final retryAfter = error.response?.headers.value('retry-after');
    final seconds = int.tryParse(retryAfter ?? '');
    if (seconds != null && seconds > 0) {
      return Duration(seconds: seconds);
    }
    final fallbackSeconds = switch (_rateLimitAttempts) {
      0 => 5,
      1 => 10,
      2 => 20,
      3 => 40,
      _ => 60,
    };
    _rateLimitAttempts++;
    return Duration(seconds: fallbackSeconds);
  }

  int _secondsRemaining(Duration duration) =>
      (duration.inMilliseconds / Duration.millisecondsPerSecond).ceil();

  @override
  Future<void> close() {
    _retryTimer?.cancel();
    return super.close();
  }
}
