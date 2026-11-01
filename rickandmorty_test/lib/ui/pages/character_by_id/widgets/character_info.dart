import 'package:flutter/material.dart';
import 'package:rickandmorty_test/data/services/models/character_model/character_model.dart';
import 'package:rickandmorty_test/ui/pages/character_by_id/widgets/character_info_block.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({super.key, required this.character});

  final CharacterResult character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 14, right: 14, bottom: 10),
      child: Column(
        spacing: 20,
        children: [
          CharacterInfoBlock(
            payload: (
              icon: Icons.person_2_outlined,
              title: 'Вид',
              text: character.species,
            ),
          ),
          CharacterInfoBlock(
            payload: (
              icon: Icons.location_city_outlined,
              title: 'Происхождение',
              text: character.location.name,
            ),
          ),
          CharacterInfoBlock(
            payload: (
              icon: switch (character.gender.toLowerCase()) {
                'male' => Icons.male_outlined,
                'female' => Icons.female_outlined,
                _ => Icons.person_outline,
              },
              title: 'Гендер',
              text: character.gender,
            ),
          ),
        ],
      ),
    );
  }
}
