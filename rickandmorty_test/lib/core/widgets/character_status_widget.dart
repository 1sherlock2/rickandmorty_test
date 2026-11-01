import 'package:flutter/material.dart';
import 'package:rickandmorty_test/core/enums/character_status_enum.dart';
import 'package:rickandmorty_test/data/services/models/character_model/character_model.dart';

class CharacterStatusWidget extends StatelessWidget {
  const CharacterStatusWidget({
    super.key,
    required this._characterItem,
    this.fontSize = 14,
  });

  final CharacterResult _characterItem;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Icon(
          Icons.circle_rounded,
          size: 14,
          color: switch (CharacterStatusEnum.fromString(
            _characterItem.status.toLowerCase(),
          )) {
            CharacterStatusEnum.alive => Colors.green,
            CharacterStatusEnum.dead => Colors.red,
            CharacterStatusEnum.unknown => Colors.grey,
          },
        ),
        Text(
          CharacterStatusEnum.fromString(_characterItem.status.toLowerCase())
              .displayName,
          style: TextStyle(
            fontSize: fontSize,
            color: switch (CharacterStatusEnum.fromString(
              _characterItem.status.toLowerCase(),
            )) {
              CharacterStatusEnum.alive => Colors.green,
              CharacterStatusEnum.dead => Colors.red,
              CharacterStatusEnum.unknown => Colors.grey,
            },
          ),
        ),
      ],
    );
  }
}
