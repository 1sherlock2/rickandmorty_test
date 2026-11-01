import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty_test/core/routing/routes.dart';
import 'package:rickandmorty_test/data/repositories/character_repository.dart';
import 'package:rickandmorty_test/ui/bloc/character_by_id/character_by_id_bloc.dart';
import 'package:rickandmorty_test/ui/bloc/character_by_id/character_by_id_event.dart';
import 'package:rickandmorty_test/ui/pages/character_by_id/character_by_id.dart';
import 'package:rickandmorty_test/ui/pages/characters/characters.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.characters,
  routes: [
    GoRoute(path: Routes.characters, builder: (context, state) => Characters()),
    GoRoute(
      path: Routes.characterById,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return BlocProvider(
          create: (context) =>
              CharacterByIdBloc(context.read<CharacterRepository>())
                ..add(CharacterByIdRequested(characterId: id)),
          child: CharacterById(id: id!),
        );
      },
    ),
  ],
);
