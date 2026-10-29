import 'package:go_router/go_router.dart';
import 'package:rickandmorty_test/core/routing/routes.dart';
import 'package:rickandmorty_test/ui/pages/characters/characters.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.characters,
  routes: [
    GoRoute(path: Routes.characters, builder: (context, state) => Characters()),
  ],
);
