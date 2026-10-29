import 'package:rickandmorty_test/data/services/api_client.dart';
import 'package:rickandmorty_test/data/services/models/character_model/character_model.dart';

class CharacterRepository {
  new({required this._apiClient});

  final ApiClient _apiClient;

  Future<CharacterModel> getCharacters({required int page}) async {
    final response = await _apiClient.getCharacters(page);
    return response.getOrThrow();
  }
}
