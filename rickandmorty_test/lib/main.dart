import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_test/core/providers.dart';
import 'package:rickandmorty_test/core/routing/router.dart';
import 'package:rickandmorty_test/ui/bloc/block_providers.dart';
import 'package:rickandmorty_test/ui/core/theme.dart';

void main() {
  runApp(MultiRepositoryProvider(providers: providers, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp.router(
        routerConfig: router,
        themeMode: ThemeMode.dark,
        theme: AppTheme.darkTheme,
      ),
    );
  }
}
