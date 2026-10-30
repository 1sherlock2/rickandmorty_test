enum CharacterStatusEnum {
  alive('Alive'),
  unknown('Unknown'),
  dead('Dead');

  final String displayName;
  const CharacterStatusEnum(this.displayName);

  static CharacterStatusEnum fromString(String value) {
    return CharacterStatusEnum.values.firstWhere(
      (status) => status.name == value,
      orElse: () => throw ArgumentError('Unknown statis: $value'),
    );
  }
}
