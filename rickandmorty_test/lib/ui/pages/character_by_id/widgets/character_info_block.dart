import 'package:flutter/material.dart';
import 'package:rickandmorty_test/ui/core/colors.dart';

typedef CharacterInfoPayload = ({IconData icon, String title, String text});

class CharacterInfoBlock extends StatelessWidget {
  const CharacterInfoBlock({super.key, required this.payload});

  final CharacterInfoPayload payload;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.customBlue2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 20,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.customBlue3,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(payload.icon, color: AppColors.lightBrown100, size: 30),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [payload.title, payload.text]
                .map(
                  (e) => Text(
                    e,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.lightBrown100,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
