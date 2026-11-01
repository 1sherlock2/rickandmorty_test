sealed class CharacterByIdEvent {
  const CharacterByIdEvent();
}

final class CharacterByIdRequested extends CharacterByIdEvent {
  const CharacterByIdRequested({required this.characterId});
  final String characterId;
}
