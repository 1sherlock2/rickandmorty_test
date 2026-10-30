import 'package:equatable/equatable.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object?> get props => [];
}

final class CharactersRequested extends CharacterEvent {
  const CharactersRequested();
}

final class CharacterNextPageRequested extends CharacterEvent {
  const CharacterNextPageRequested();
}

final class CharacterRetryCountdownTick extends CharacterEvent {
  const CharacterRetryCountdownTick();
}
