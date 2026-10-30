import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:rickandmorty_test/data/services/models/character_model/character_model.dart';

class ApiClient {
  new(this._dio);

  final Dio _dio;

  final String _baseUrl = 'https://rickandmortyapi.com/api';

  Failure<T, Exception> formatExceptionFailure<T extends Object>(
    Object error,
  ) => Failure<T, Exception>(FormatException('Failed to parse $error'));

  AsyncResult<CharacterModel> getCharacters(int page) async {
    try {
      final response = await _dio.get('$_baseUrl/character/?page=$page');
      try {
        final data = response.data as Map<String, dynamic>;
        return Success(CharacterModel.fromJson(data));
      } catch (error) {
        return formatExceptionFailure<CharacterModel>(error);
      }
    } on DioException catch (error) {
      return Failure(error);
    } catch (error) {
      return Failure(FormatException('Failed to query $error'));
    }
  }
}
