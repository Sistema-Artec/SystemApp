// Classe criada para ir substituindo a claase antiga de autenticação: authentication_repository.dart
part of '../../authentication.dart';

abstract class AuthenticationRepository {
  Future<void> login({
    required String email,
    required String password,
  });
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl([ApiClient? client]) {
    _client = client ?? ApiClientImpl();
  }

  late final ApiClient _client;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    var data = {
      'email': email,
      'password': password,
    };
    final response = await _client.post(_baseUrl, data: data);
    print(response);
  }

  String get _baseUrl => '${environment['baseUrl']}/api/login/';
}
