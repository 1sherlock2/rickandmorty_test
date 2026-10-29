import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rickandmorty_test/ui/core/colors.dart';

class Characters extends StatefulWidget {
  const Characters({super.key});

  @override
  State<Characters> createState() => _CharactersState();
}

class _CharactersState extends State<Characters> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.customBlue,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.customBlue,
        body: const SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 14, left: 14, right: 14),
            child: Column(
              children: [
                Text(
                  'Персонажи',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
