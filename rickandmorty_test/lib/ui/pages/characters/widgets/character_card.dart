import 'package:flutter/material.dart';
import 'package:rickandmorty_test/core/enums/character_status_enum.dart';
import 'package:rickandmorty_test/data/services/models/character_model/character_model.dart';
import 'package:rickandmorty_test/ui/core/colors.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.characterItem});

  final CharacterResult characterItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.customBlue2,
      ),
      child: Row(
        spacing: 12,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                characterItem.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    debugPrint('Image loaded: ${characterItem.image}');
                    return child;
                  }
                  final total = loadingProgress.expectedTotalBytes;
                  return SizedBox(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: total != null && total > 0
                            ? loadingProgress.cumulativeBytesLoaded / total
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  debugPrint('image load failed: ${characterItem.image}');
                  return const SizedBox(
                    width: 80,
                    height: 80,
                    child: Icon(Icons.broken_image),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                Text(
                  characterItem.name,
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Text(characterItem.species),
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      size: 14,
                      color: switch (CharacterStatusEnum.fromString(
                        characterItem.status.toLowerCase(),
                      )) {
                        CharacterStatusEnum.alive => Colors.green,
                        CharacterStatusEnum.dead => Colors.red,
                        CharacterStatusEnum.unknown => Colors.grey,
                      },
                    ),
                    Text(
                      CharacterStatusEnum.fromString(
                        characterItem.status.toLowerCase(),
                      ).displayName,
                      style: TextStyle(
                        color: switch (CharacterStatusEnum.fromString(
                          characterItem.status.toLowerCase(),
                        )) {
                          CharacterStatusEnum.alive => Colors.green,
                          CharacterStatusEnum.dead => Colors.red,
                          CharacterStatusEnum.unknown => Colors.grey,
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
