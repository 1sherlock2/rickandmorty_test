import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rickandmorty_test/data/repositories/character_repository.dart';
import 'package:rickandmorty_test/ui/bloc/character/character_bloc.dart';
import 'package:rickandmorty_test/ui/bloc/character/character_event.dart';

List<SingleChildWidget> get blocProviders {
  return [
    BlocProvider(
      create: (BuildContext context) =>
          CharacterBloc(context.read<CharacterRepository>())
            ..add(CharactersRequested()),
    ),
  ];
}
