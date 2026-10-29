import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rickandmorty_test/data/repositories/character_repository.dart';
import 'package:rickandmorty_test/data/services/api_client.dart';

List<SingleChildWidget> get providers {
  final dio = Dio();
  return [
    RepositoryProvider(create: (_) => ApiClient(dio)),
    RepositoryProvider(
      create: (context) =>
          CharacterRepository(apiClient: context.read<ApiClient>()),
    ),
  ];
}
